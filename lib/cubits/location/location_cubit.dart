import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:parking_app/models/hive_parking_place.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/repositories/location/i_location.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.locationRepository) : super(LocationState.initial());

  final ILocation locationRepository;
  Location userLocation;

  Future<void> getLocation() async {
    Position result;
    try {
      result = await locationRepository.getActualPosition();
    } catch (e) {
      print(e.toString());
    }

    var savedParkings = await Hive.openBox('parkings');

    userLocation = Location(result.latitude, result.longitude);
    var parkings = await getNearbyParkings();

    int amountOfSavedParkings = Hive.box('parkings').length;

    if (amountOfSavedParkings > 0) {
      for (int i = 0; i < amountOfSavedParkings; i++) {
        var hiveParking = savedParkings.get(i) as HiveParkingPlace;
        ParkingPlace parking = ParkingPlace.fromHive(hiveParking);
        parkings.add(parking);
      }
    }

    emit(state.copyWith(
        position: Position(
          latitude: result.latitude,
          longitude: result.longitude,
        ),
        markers: convertParkingPlacesToMarkers(parkings),
        parkings: parkings));
  }

  Future<List<ParkingPlace>> getNearbyParkings() async {
    List<ParkingPlace> places;
    try {
      places = await locationRepository.getNearbyParkings(userLocation);
    } catch (e) {
      print(e.toString());
    }

    return places;
  }

  Set<Marker> convertParkingPlacesToMarkers(List<ParkingPlace> places) {
    Set<Marker> markers = HashSet<Marker>();

    places.forEach((parking) {
      markers.add(
        Marker(
          markerId: MarkerId(parking.name),
          draggable: false,
          onTap: () {
            emit(state.copyWith(chosenParking: parking));
          },
          position: LatLng(
              parking.geometry.location.lat, parking.geometry.location.lng),
          infoWindow: InfoWindow(title: parking.name),
        ),
      );
    });
    return markers;
  }

  void resetMap() {
    emit(state.copyWith(chosenParking: null));
  }
}
