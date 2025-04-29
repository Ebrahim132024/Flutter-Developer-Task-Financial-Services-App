import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'complaint_form_state.dart';




class ComplaintFormCubit extends Cubit<ComplaintFormState> {
  ComplaintFormCubit()
      : super(ComplaintFormState(
    formKey: GlobalKey<FormState>(),
    name: '',
    phone: '',
    details: '',
    typeIndex: 0,
  ));

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updatePhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void updateDetails(String details) {
    emit(state.copyWith(details: details));
  }

  void updateType(int index) {
    emit(state.copyWith(typeIndex: index));
  }

  void submitForm() {
    if (state.formKey.currentState!.validate()) {
      emit(state.copyWith(error: null));
      // Send to API or store locally
    } else {
      emit(state.copyWith(error: "Please fix errors before submitting"));
    }
  }
}