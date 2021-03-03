import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parking_app/cubits/location/location_cubit.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/screens/core/custom_rating_bar.dart';

class ChosenParkingCard extends StatelessWidget {
  final ParkingPlace parking;

  bool isNewParking;

  ChosenParkingCard({
    Key key,
    this.parking,
    this.isNewParking = true,
  }) : super(key: key);

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
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(
                          context, '/addParkingPlace',
                          arguments: {'parking': parking});

                      if (result != null) {
                        ParkingPlace newParking = result['parking'];

                        BlocProvider.of<LocationCubit>(context)
                            .updatePinsWithNewParking(newParking);
                      }
                    },
                    child: Text(
                        isNewPin(parking) ? 'Create parking' : 'Save parking')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

bool isNewPin(ParkingPlace parking) {
  if (parking.name == 'New parking location' &&
      parking.description ==
          'Click save parking to create own parking location. It will always be with you.') {
    return true;
  } else {
    return false;
  }
}
