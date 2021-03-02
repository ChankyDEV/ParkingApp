part of 'save_parking_form_cubit.dart';

@freezed
abstract class SaveParkingFormState with _$SaveParkingFormState {
  const factory SaveParkingFormState.initial(
      {String name,
      String description,
      double rating,
      String nameLabel,
      String descriptionLabel}) = _Initial;
}
