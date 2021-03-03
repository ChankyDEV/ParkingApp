import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_parking_form_state.dart';
part 'save_parking_form_cubit.freezed.dart';

class SaveParkingFormCubit extends Cubit<SaveParkingFormState> {
  SaveParkingFormCubit()
      : super(SaveParkingFormState.initial(
            nameLabel: 'Name', descriptionLabel: 'Description'));

  void nameChanged(String input) {
    emit(state.copyWith(name: input, nameLabel: 'Name'));
  }

  void descriptionChanged(String input) {
    emit(state.copyWith(description: input, descriptionLabel: 'Description'));
  }

  void ratingChanged(double input) {
    emit(state.copyWith(rating: input));
  }
}
