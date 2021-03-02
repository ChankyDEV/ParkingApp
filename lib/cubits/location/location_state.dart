part of 'location_cubit.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState.initial(
      {Position position,
      Set<Marker> markers,
      List<ParkingPlace> parkings,
      ParkingPlace chosenParking}) = _Initial;
}
