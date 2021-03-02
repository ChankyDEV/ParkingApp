import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:http/http.dart';
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

    if (isGPSenabled) {
      permission = await Geolocator.checkPermission();
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
}
