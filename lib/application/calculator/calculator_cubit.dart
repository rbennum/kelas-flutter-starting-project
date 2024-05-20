import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/calculator_entity.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/calculator_type.dart';

part 'calculator_cubit.freezed.dart';
part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState.Empty()) {
    leftFieldController = TextEditingController();
    rightFieldController = TextEditingController();
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
}
