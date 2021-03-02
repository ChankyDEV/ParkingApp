import 'package:hive/hive.dart';
import 'package:parking_app/models/parking_place.dart';

part 'hive_parking_place.g.dart';

@HiveType(typeId: 0, adapterName: 'HiveTypeAdapter')
class HiveParkingPlace {
  @HiveField(0)
  final double lat;
  @HiveField(1)
  final double lng;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String descripion;
  @HiveField(4)
  final double rating;

  HiveParkingPlace(this.lat, this.lng, this.name, this.descripion, this.rating);

  factory HiveParkingPlace.fromParkingPlace(ParkingPlace parking) =>
      HiveParkingPlace(
          parking.geometry.location.lat,
          parking.geometry.location.lng,
          parking.name,
          parking.description,
          parking.rating);
}
