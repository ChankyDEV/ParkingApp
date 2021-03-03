import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/cubits/location/location_cubit.dart';
import 'package:parking_app/models/geometry.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/repositories/location/location_repository.dart';

void main() {
  test('should return marker with the same title as given parking name', () {
    var cubit = LocationCubit(LocationRepository());
    ParkingPlace parkingPlace = ParkingPlace(
        Location(0.0, 0.0),
        Geometry(Location(0.0, 0.0)),
        'parking name',
        'parking description',
        5.0);
    Marker marker = cubit.parkingToMarker(parkingPlace);

    expect(marker.infoWindow.title, 'parking name');
  });
}
