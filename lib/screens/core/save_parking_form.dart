import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:parking_app/cubits/save_parking/save_parking_form_cubit.dart';
import 'package:parking_app/models/parking_place.dart';

class SaveParkingForm extends StatelessWidget {
  final ParkingPlace parking;

  const SaveParkingForm({Key key, this.parking}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocBuilder<SaveParkingFormCubit, SaveParkingFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset.zero,
                      blurRadius: 5,
                      spreadRadius: 1)
                ],
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 30.0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (input) {
                        context.read<SaveParkingFormCubit>().nameChanged(input);
                      },
                      minLines: 1,
                      maxLines: 5,
                      autofocus: false,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        labelText: state.nameLabel,
                        labelStyle: TextStyle(color: Colors.grey[800]),
                        errorStyle: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter parking name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (input) {
                        context
                            .read<SaveParkingFormCubit>()
                            .descriptionChanged(input);
                      },
                      minLines: 1,
                      maxLines: 5,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        labelText: state.descriptionLabel,
                        labelStyle: TextStyle(color: Colors.grey[800]),
                        errorStyle: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter description';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (value) {
                        context
                            .read<SaveParkingFormCubit>()
                            .ratingChanged(value);
                      },
                      initialRating: 0,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          color: Colors.amberAccent[200],
                        );
                      },
                      itemSize: 40.0,
                      itemCount: 5,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            var newParking = ParkingPlace(
                                parking.location,
                                parking.geometry,
                                state.name,
                                state.description,
                                state.rating);
                            print(newParking.description);
                            print(newParking.name);
                            print(newParking.geometry.location.lat);
                            print(newParking.geometry.location.lng);
                            print(newParking.rating);
                            BlocProvider.of<SaveParkingFormCubit>(context)
                                .saveParking(newParking);
                          }
                        },
                        child: Text('Save')),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
