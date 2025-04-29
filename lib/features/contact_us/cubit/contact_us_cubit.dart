import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';



class ContactFormCubit extends Cubit<ContactFormState> {
  ContactFormCubit() : super(ContactFormState());

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updatePhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void updateMessage(String message) {
    emit(state.copyWith(message: message));
  }

  void submitForm() {
    if (state.name.isEmpty || state.phone.isEmpty || state.message.isEmpty) {
      emit(state.copyWith(error: "All fields are required", isValid: false));
    } else {
      emit(state.copyWith(error: null, isValid: true));
      // You can call a real API here
    }
  }
}