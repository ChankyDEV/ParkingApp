import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:parking_app/cubits/location/location_cubit.dart';
import 'package:parking_app/models/search_result/place.dart';
import 'package:parking_app/screens/core/chosen_parking_card.dart';
import 'package:parking_app/screens/core/loading_screen.dart';
import 'dart:async';

@immutable
class HomeScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();
  var searchBarController = FloatingSearchBarController();

  void updateLocation(
      Place place, BuildContext context, bool isLocationUpdated) async {
    if (place != null && isLocationUpdated == true) {
      var controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLng(
          LatLng(place.geometry.location.lat, place.geometry.location.lng)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state.position != null && state.markers != null) {
              updateLocation(
                  state.updatedUserLocation, context, state.isLocationUpdated);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        GoogleMap(
                          myLocationEnabled: true,
                          onCameraIdle: () {
                            if (state.isLocationUpdated) {
                              BlocProvider.of<LocationCubit>(context)
                                  .configureUserLocationAndLoadParkings(true);
                            }
                          },
                          onMapCreated: (controller) {
                            _controller.complete(controller);
                          },
                          onTap: (tapLocation) {
                            BlocProvider.of<LocationCubit>(context).resetMap();
                          },
                          onLongPress: (pressLocation) {
                            BlocProvider.of<LocationCubit>(context)
                                .setNewChosenParking(pressLocation);
                          },
                          markers: state.markers,
                          initialCameraPosition: CameraPosition(
                            bearing: 0.0,
                            target: LatLng(state.position.latitude,
                                state.position.longitude),
                            tilt: 0.0,
                            zoom: 13,
                          ),
                        ),
                        FloatingSearchBar(
                            controller: searchBarController,
                            hint: 'Search...',
                            scrollPadding:
                                const EdgeInsets.only(top: 16, bottom: 56),
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            transitionCurve: Curves.easeInOut,
                            physics: const BouncingScrollPhysics(),
                            axisAlignment: -0.8,
                            openAxisAlignment: 0.0,
                            openMaxWidth: MediaQuery.of(context).size.width,
                            maxWidth: MediaQuery.of(context).size.width / 1.3,
                            debounceDelay: const Duration(milliseconds: 500),
                            transition: CircularFloatingSearchBarTransition(),
                            onQueryChanged: (query) {
                              BlocProvider.of<LocationCubit>(context)
                                  .searchTermChanged(query);
                            },
                            onSubmitted: (query) {},
                            actions: [
                              FloatingSearchBarAction(
                                showIfOpened: false,
                                child: CircularButton(
                                  icon: const Icon(Icons.place),
                                  onPressed: () {},
                                ),
                              ),
                              FloatingSearchBarAction.searchToClear(
                                showIfClosed: false,
                              ),
                            ],
                            builder: (context, transition) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 4.0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: state.searches.map((term) {
                                      return ListTile(
                                        title: Text(term.description),
                                        onTap: () async {
                                          BlocProvider.of<LocationCubit>(
                                                  context)
                                              .updateUserLocation(term);
                                          searchBarController.close();
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            }),
                      ],
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
}
