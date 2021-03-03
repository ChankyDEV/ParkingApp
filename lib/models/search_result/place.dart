import 'dart:convert';

import 'package:parking_app/models/geometry.dart';
import 'package:parking_app/models/search_result/search_result.dart';

class Place {
  final SearchResult searchResult;
  final Geometry geometry;

  Place(this.searchResult, this.geometry);

  Map<String, dynamic> toMap() {
    return {
      'searchResult': searchResult?.toMap(),
      'geometry': geometry?.toMap(),
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Place(
      SearchResult.fromMap(map['searchResult']),
      Geometry.fromMap(map['geometry']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));
}
