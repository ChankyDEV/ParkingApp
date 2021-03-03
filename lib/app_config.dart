import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/cubits/location/location_cubit.dart';
import 'package:parking_app/cubits/save_parking/save_parking_form_cubit.dart';
import 'package:parking_app/repositories/location/location_repository.dart';
import 'package:parking_app/screens/home_screen.dart';
import 'package:parking_app/screens/new_parking_place_screen.dart';

class AppConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LocationCubit(LocationRepository())
              ..configureUserLocationAndLoadParkings(false)),
        BlocProvider(create: (context) => SaveParkingFormCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/addParkingPlace': (context) => NewParkingPlaceScreen()
        },
      ),
    );
  }
}
