import 'package:geolocator/geolocator.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';

abstract class ILocation {
  Future<Position> getActualPosition();
  Future<List<ParkingPlace>> getNearbyParkings(Location userLocation);
}
