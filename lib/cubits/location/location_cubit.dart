import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:parking_app/models/geometry.dart';
import 'package:parking_app/models/location.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/repositories/location/i_location.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.locationRepository) : super(LocationState.initial());

  final ILocation locationRepository;
  Location userLocation;

  Future<void> updatePinsWithNewParking(ParkingPlace parking) async {
    List<ParkingPlace> _parkings = state.parkings;
    Set<Marker> _markers = state.markers;
    Marker oldMarker;
    _markers.forEach((marker) {
      if (marker.infoWindow.title == 'New parking location') {
        oldMarker = marker;
      }
    });

    _markers.remove(oldMarker);
    _markers.add(parkingToMarker(parking));
    _parkings.add(parking);

    emit(state.copyWith(
        position: Position(
          latitude: parking.geometry.location.lat,
          longitude: parking.geometry.location.lng,
        ),
        markers: _markers,
        parkings: _parkings,
        chosenParking: null,
        isConfiguringAgain: true));
  }

  Future<void> configureUserLocationAndLoadParkings(
      bool isConfiguredAgain) async {
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
        parkings: parkings,
        isConfiguringAgain: false));
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
      markers.add(parkingToMarker(parking));
    });
    return markers;
  }

  Marker parkingToMarker(ParkingPlace parking) {
    return Marker(
      markerId: MarkerId(parking.name),
      draggable: false,
      onTap: () {
        emit(state.copyWith(chosenParking: parking, isConfiguringAgain: false));
      },
      position:
          LatLng(parking.geometry.location.lat, parking.geometry.location.lng),
      infoWindow: InfoWindow(title: parking.name),
    );
  }

  void resetMap() {
    emit(state.copyWith(chosenParking: null));
  }

  void setNewChosenParking(LatLng pressedLocation) async {
    resetMap();
    var location =
        Location(pressedLocation.latitude, pressedLocation.longitude);
    ParkingPlace parking = ParkingPlace(location, Geometry(location),
        'New parking location', 'Click to save parking', 0.0);

    Set<Marker> updatedMarkers = state.markers;

    updatedMarkers.forEach((marker) {
      if (marker.infoWindow.title == 'New parking location') {
        updatedMarkers.remove(marker);
        emit(state.copyWith(
          markers: updatedMarkers,
        ));
      }
    });
    updatedMarkers.add(parkingToMarker(parking));

    emit(state.copyWith(
      chosenParking: parking,
      markers: updatedMarkers,
    ));
  }
}
