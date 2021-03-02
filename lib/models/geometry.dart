import 'dart:convert';

import 'package:parking_app/models/location.dart';

class Geometry {
  final Location location;

  Geometry(this.location);

  Map<String, dynamic> toMap() {
    return {
      'location': location?.toMap(),
    };
  }

  factory Geometry.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return Geometry(
      Location.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Geometry.fromJson(String source) =>
      Geometry.fromMap(json.decode(source));
}
