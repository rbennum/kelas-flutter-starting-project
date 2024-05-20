import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/calculator_type.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/history_entity.dart';

part 'calculator_entity.freezed.dart';

@freezed
class CalculatorEntity with _$CalculatorEntity {
  const CalculatorEntity._();
  factory CalculatorEntity({
    required double value,
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
    required List<HistoryEntity> histories,
    required bool isPressed,
  }) = _CalculatorEntity;
  factory CalculatorEntity.empty() => CalculatorEntity(
        value: 0,
        leftValue: "",
        rightValue: "",
        type: const CalculatorType.none(),
        histories: [],
        isPressed: false,
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(leftValue)
        .andThen(() => FormValidator.emptyValidator(rightValue))
        .fold((failure) => some(failure), (data) => none());
  }
}
