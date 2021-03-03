import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/repositories/location/i_location.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.locationRepository) : super(LocationState.initial());

  final ILocation locationRepository;
  Location userLocation;

  Future<void> configureUserLocationAndLoadParkings() async {
    Position result;
    try {
      result = await locationRepository.getActualPosition();
    } catch (e) {
      print(e.toString());
    }

    userLocation = Location(result.latitude, result.longitude);
    var parkings = await getNearbyParkings();
    try {
      parkings = await locationRepository.addSavedParkings(parkings);
    } catch (e) {
      print(e.toString());
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
