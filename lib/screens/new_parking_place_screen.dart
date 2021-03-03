import 'package:flutter/material.dart';
import 'package:parking_app/models/parking_place.dart';
import 'package:parking_app/screens/core/save_parking_form.dart';

class NewParkingPlaceScreen extends StatelessWidget {
  Map initData = {};

  @override
  Widget build(BuildContext context) {
    ParkingPlace parking;
    if (initData.isEmpty) {
      initData = ModalRoute.of(context).settings.arguments;
      parking = initData['parking'];
    } else {
      parking = ParkingPlace.empty();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Save parking',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  parking.geometry.location.lat.toStringAsFixed(3) +
                      " | " +
                      parking.geometry.location.lng.toStringAsFixed(3),
                  style: const TextStyle(fontSize: 32.0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SaveParkingForm(
            parking: parking,
          ),
        ],
      )),
    );
  }
}
