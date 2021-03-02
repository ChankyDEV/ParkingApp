import 'dart:convert';

class Location {
  final double lat;
  final double lng;

  Location(this.lat, this.lng);

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Location.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return Location(
      map['lat'],
      map['lng'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));
}
