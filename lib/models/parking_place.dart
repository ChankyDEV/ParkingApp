import 'dart:convert';

import 'package:parking_app/models/geometry.dart';
import 'package:parking_app/models/location.dart';

class ParkingPlace {
  final Location location;
  final Geometry geometry;
  final String name;
  final String description;
  final double ranking;

  ParkingPlace(
      this.location, this.geometry, this.name, this.description, this.ranking);

  Map<String, dynamic> toMap() {
    return {
      'location': location?.toMap(),
      'geometry': geometry?.toMap(),
      'name': name,
      'description': description,
      'ranking': ranking,
    };
  }

  factory ParkingPlace.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return ParkingPlace(
      Location.fromMap(map['location']),
      Geometry.fromMap(map['geometry']),
      map['name'],
      map['description'],
      map['ranking'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkingPlace.fromJson(String source) =>
      ParkingPlace.fromMap(json.decode(source));
}
