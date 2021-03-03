import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:parking_app/models/hive_parking_place.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/models/search_result/place.dart';
import 'package:parking_app/models/search_result/search_result.dart';
import 'package:parking_app/repositories/location/i_location.dart';
import 'dart:convert' as convert;

class LocationRepository implements ILocation {
  String _googleMapKey = "AIzaSyDBBd9PFQPd-VCfjpDU-zxEraXJpkTrH_Y";

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
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.lat},${userLocation.lng}&type=parking&rankby=distance&key=${_googleMapKey}";

    var results = await makeRequest(url, 'results');

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
    var savedParkings;

    if (Hive.isBoxOpen('parkings') == false) {
      savedParkings = await Hive.openBox('parkings');
    }
    savedParkings = Hive.box('parkings');
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

  @override
  Future<Place> getSearchedLocation(SearchResult pickedLocation) async {
    List<String> locationNameList = pickedLocation.description.split(',');

    String city = locationNameList[0];

    var url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$city&key=$_googleMapKey";

    var results = await makeRequest(url, 'results');

    if (results != null) {
      var place = results.map((term) => Place.fromMap(term)).first;
      return Place(pickedLocation, place.geometry);
    } else {
      return null;
    }
  }

  @override
  Future<List<SearchResult>> getSearchedTerms(String query) async {
    if (query.length > 2) {
      var url =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$_googleMapKey&sessiontoken=1234567890";

      var results = await makeRequest(url, 'predictions');
      var terms = results.map((term) => SearchResult.fromMap(term)).toList();

      return terms;
    }

    return null;
  }

  Future<List<dynamic>> makeRequest(String url, String title) async {
    var response = await get(url);
    var json = convert.jsonDecode(response.body);
    var results = json[title] as List;
    return results;
  }
}
