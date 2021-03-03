import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/cubits/location/location_cubit.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/screens/core/chosen_parking_card.dart';
import 'package:parking_app/screens/core/loading_screen.dart';
import 'dart:async';

@immutable
class HomeScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state.position != null && state.markers != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: GoogleMap(
                      onTap: (tapLocation) {
                        BlocProvider.of<LocationCubit>(context).resetMap();
                      },
                      onLongPress: (pressLocation) {
                        BlocProvider.of<LocationCubit>(context)
                            .setNewChosenParking(pressLocation);
                      },
                      onMapCreated: (controller) {
                        _controller.complete(controller);
                        if (state.isConfiguringAgain) {
                          cameraMove(state.parkings);
                        }
                      },
                      markers: state.markers,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                        bearing: 0.0,
                        target: LatLng(
                            state.position.latitude, state.position.longitude),
                        tilt: 0.0,
                        zoom: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: state.chosenParking != null ? 1 : 0,
                    child: state.chosenParking != null
                        ? ChosenParkingCard(
                            parking: state.chosenParking,
                          )
                        : Container(),
                  ),
                ],
              );
            } else {
              return Center(
                child: LoadingScreen(),
              );
            }
          },
        ),
      ),
    );
  }

  void cameraMove(List<ParkingPlace> parkings) async {
    var controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(LatLng(
        parkings.last.geometry.location.lat,
        parkings.last.geometry.location.lng)));
  }
}
