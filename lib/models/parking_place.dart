class ParkingPlace {
  final double latitude;
  final double longitude;
  final String name;
  final String description;
  final int ranking;

  ParkingPlace(
      {this.latitude,
      this.longitude,
      this.name,
      this.description,
      this.ranking});

  @override
  String toString() {
    return 'ParkingPlace(latitude: $latitude, longitude: $longitude, name: $name, description: $description, ranking: $ranking)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ParkingPlace &&
        o.latitude == latitude &&
        o.longitude == longitude &&
        o.name == name &&
        o.description == description &&
        o.ranking == ranking;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
        longitude.hashCode ^
        name.hashCode ^
        description.hashCode ^
        ranking.hashCode;
  }
}
