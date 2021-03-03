import 'package:geolocator/geolocator.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/models/search_result/place.dart';
import 'package:parking_app/models/search_result/search_result.dart';

abstract class ILocation {
  Future<Position> getActualPosition();
  Future<List<ParkingPlace>> getNearbyParkings(Location userLocation);
  Future<List<ParkingPlace>> addSavedParkings(List<ParkingPlace> parkings);
  Future<List<SearchResult>> getSearchedTerms(String query);
  Future<Place> getSearchedLocation(SearchResult pickedLocation);
}
