import 'package:flutter/material.dart';
import 'package:parking_app/screens/home_screen.dart';
import 'package:parking_app/screens/new_parking_place_screen.dart';

class AppConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addParkingPlace': (context) => NewParkingPlaceScreen()
      },
    );
  }
}
