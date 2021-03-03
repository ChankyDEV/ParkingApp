import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:parking_app/models/hive_parking_place.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/repositories/location/i_location.dart';
import 'dart:convert' as convert;

class LocationRepository implements ILocation {
  String googleMapKey = "AIzaSyDBBd9PFQPd-VCfjpDU-zxEraXJpkTrH_Y";

  @override
  Future<Position> getActualPosition() async {
    LocationPermission permission;

    bool isGPSenabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();

    if (isGPSenabled) {
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permantly denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return Future.error(
              'Location permissions are denied (actual value: $permission).');
        }
      }

      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
    } else {
      return null;
    }
  }

  @override
  Future<List<ParkingPlace>> getNearbyParkings(Location userLocation) async {
    var url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.lat},${userLocation.lng}&type=parking&rankby=distance&key=${googleMapKey}";

    var response = await get(url);
    var json = convert.jsonDecode(response.body);
    var results = json['results'] as List;

    var places = results
        .map(
          (parking) => ParkingPlace.fromMap(parking),
        )
        .toList();

    return places;
  }

  @override
  Future<List<ParkingPlace>> addSavedParkings(
      List<ParkingPlace> parkings) async {
    var savedParkings = await Hive.openBox('parkings');
    int amountOfSavedParkings = Hive.box('parkings').length;

    if (amountOfSavedParkings > 0) {
      for (int i = 0; i < amountOfSavedParkings; i++) {
        var hiveParking = savedParkings.get(i) as HiveParkingPlace;
        ParkingPlace parking = ParkingPlace.fromHive(hiveParking);
        parkings.add(parking);
      }
    }

    return parkings;
  }
}
