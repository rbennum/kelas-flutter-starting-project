import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/application/input_validation/input_validation_state.dart';

class InputValidationCubit extends Cubit<InputValidationState> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  InputValidationCubit() : super(InputValidationState.initial()) {
    nameController = TextEditingController()..addListener(onNameChanged);
    emailController = TextEditingController()..addListener(onEmailChanged);
  }

  void onNameChanged() {
    inputName(nameController.text);
  }

  void onEmailChanged() {
    inputEmail(emailController.text);
  }

  void inputName(String name) {
    emit(state.unmodified.copyWith.entity(name: name));
  }

  void inputEmail(String email) {
    emit(state.unmodified.copyWith.entity(email: email));
  }

  void submit() {
    if (state.entity.failureOption.isNone()) {
      emit(state.copyWith(isValid: true));
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }
}
