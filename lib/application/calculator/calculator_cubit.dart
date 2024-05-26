import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/calculator_entity.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/calculator_type.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/history_entity.dart';

part 'calculator_cubit.freezed.dart';
part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState.Empty()) {
    leftFieldController = TextEditingController()..addListener(inputLeftValue);
    rightFieldController = TextEditingController()
      ..addListener(inputRightValue);
  }

  late TextEditingController leftFieldController;
  late TextEditingController rightFieldController;

  void selectType(CalculatorType type) {
    if (state.isSelectedType(type)) {
      emit(state.unmodified.copyWith.model(type: const CalculatorType.none()));
    } else {
      emit(state.unmodified.copyWith.model(type: type));
    }
  }

  void inputLeftValue() {
    emit(state.copyWith(showError: false));
    emit(state.unmodified.copyWith.model(leftValue: leftFieldController.text));
  }

  void inputRightValue() {
    emit(state.copyWith(showError: false));
    emit(
      state.unmodified.copyWith.model(rightValue: rightFieldController.text),
    );
  }

  void submit() {
    state.model.type.when(
      none: () {},
      add: () => addValues(),
      subtract: () => subtractValues(),
      multiply: () => multiplyValues(),
      divide: () => divideValues(),
      pow: () => powerValues(),
    );
  }

  void addValues() {
    if (state.model.failureOption.isNone()) {
      emit(state.copyWith(showError: false));
      int leftValue = int.parse(leftFieldController.text);
      int rightValue = int.parse(rightFieldController.text);
      saveToHistoryList((leftValue + rightValue).toDouble());
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }

  void subtractValues() {
    if (state.model.failureOption.isNone()) {
      emit(state.copyWith(showError: false));
      int leftValue = int.parse(leftFieldController.text);
      int rightValue = int.parse(rightFieldController.text);
      saveToHistoryList((leftValue - rightValue).toDouble());
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }

  void multiplyValues() {
    if (state.model.failureOption.isNone()) {
      emit(state.copyWith(showError: false));
      int leftValue = int.parse(leftFieldController.text);
      int rightValue = int.parse(rightFieldController.text);
      saveToHistoryList((leftValue * rightValue).toDouble());
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }

  void divideValues() {
    if (state.model.failureOption.isNone()) {
      emit(state.copyWith(showError: false));
      int leftValue = int.parse(leftFieldController.text);
      int rightValue = int.parse(rightFieldController.text);
      saveToHistoryList(leftValue.toDouble() / rightValue);
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }

  void powerValues() {
    if (state.model.failureOption.isNone()) {
      emit(state.copyWith(showError: false));
      int baseInt = int.parse(leftFieldController.text);
      int exponentInt = int.parse(rightFieldController.text);
      saveToHistoryList(pow(baseInt, exponentInt).toDouble());
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }

  void saveToHistoryList(double result) {
    emit(
      state.unmodified.copyWith.model(
        histories: state.model.newHistoryCollection,
        value: result,
        isPressed: true,
      ),
    );
  }

  void restoreHistory(int id) {
    final fetchedHistory = state.model.restoreHistory(id);

    leftFieldController.removeListener(inputLeftValue);
    rightFieldController.removeListener(inputRightValue);

    leftFieldController.value =
        TextEditingValue(text: fetchedHistory.leftValue);
    rightFieldController.value =
        TextEditingValue(text: fetchedHistory.rightValue);

    leftFieldController.addListener(inputLeftValue);
    rightFieldController.addListener(inputRightValue);

    emit(state.unmodified.copyWith.model(
      leftValue: fetchedHistory.leftValue,
      rightValue: fetchedHistory.rightValue,
      type: fetchedHistory.type,
      histories: state.model.removeHistory(id),
    ));
  }
}
