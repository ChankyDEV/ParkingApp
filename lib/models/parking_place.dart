import 'dart:convert';
import 'package:parking_app/models/geometry.dart';
import 'package:parking_app/models/hive_parking_place.dart';
import 'package:parking_app/models/location.dart';

class ParkingPlace {
  final Location location;
  final Geometry geometry;
  final String name;
  final String description;
  final double rating;

  ParkingPlace(
      this.location, this.geometry, this.name, this.description, this.rating);

  Map<String, dynamic> toMap() {
    return {
      'location': location?.toMap(),
      'geometry': geometry?.toMap(),
      'name': name,
      'description': description,
      'rating': rating,
    };
  }

  factory ParkingPlace.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ParkingPlace(
      Location.fromMap(map['location']),
      Geometry.fromMap(map['geometry']),
      map['name'],
      map['vicinity'],
      map['rating'] == null ? 0.0 : map['rating'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkingPlace.fromJson(String source) =>
      ParkingPlace.fromMap(json.decode(source));

  factory ParkingPlace.fromHive(HiveParkingPlace hiveParking) => ParkingPlace(
      Location(hiveParking.lat, hiveParking.lng),
      Geometry(
        Location(hiveParking.lat, hiveParking.lng),
      ),
      hiveParking.name,
      hiveParking.descripion,
      hiveParking.rating);
}
