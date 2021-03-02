import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:parking_app/cubits/location/location_cubit.dart';
import 'package:parking_app/models/parking_place.dart';

@immutable
class HomeScreen extends StatelessWidget {
  Position _position;
  Set<Marker> _markers;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 1.4;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state.position != null && state.markers != null) {
              _position = state.position;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: GoogleMap(
                      onTap: (argument) {
                        BlocProvider.of<LocationCubit>(context).resetMap();
                      },
                      markers: state.markers,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                        bearing: 0.0,
                        target: LatLng(_position.latitude, _position.longitude),
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
}

class ChosenParkingCard extends StatelessWidget {
  final ParkingPlace parking;

  const ChosenParkingCard({Key key, this.parking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        parking != null ? parking.name : "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    CustomRatingBar(
                        rating: parking.rating != null ? parking.rating : 1,
                        minRating: 1,
                        maxRating: 5),
                  ],
                ),
                Text(parking.geometry.location.lat.toStringAsFixed(3) +
                    ", " +
                    parking.geometry.location.lng.toStringAsFixed(3)),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  parking.description != null
                      ? parking.description
                      : "This parking hasn't any description",
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addParkingPlace',
                          arguments: {'parking': parking});
                    },
                    child: Text('Save Parking')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final double minRating;
  final int maxRating;

  const CustomRatingBar({Key key, this.rating, this.minRating, this.maxRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: Colors.amberAccent[200],
        );
      },
      itemSize: 20.0,
      itemCount: 5,
      direction: Axis.horizontal,
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/car.png'),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Find your favourite parking place',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made by Kamil Koczan',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
