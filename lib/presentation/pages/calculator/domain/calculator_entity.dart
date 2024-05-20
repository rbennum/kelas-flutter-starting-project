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
        .andThen(
          () => FormValidator.emptyValidator(rightValue),
        )
        .andThen(
          () => FormValidator.customValidator(
            validator: operandCannotBeZeroValidator,
          ),
        )
        .fold(
          (failure) => some(failure),
          (data) => none(),
        );
  }

  String get convertValue {
    RegExp rule = RegExp(r'([.]*0)(?!.*\d)');
    final String stringValue = value.toString();
    final List<String> valueSplitted = stringValue.split('.');
    if (valueSplitted[1].length == 1 && valueSplitted[1] == '0') {
      return stringValue.replaceAll(rule, '');
    }
    return stringValue;
  }

  String? get leftFieldErrorMessage {
    return FormValidator.emptyValidator(leftValue).fold(
      (failure) => failure.maybeWhen(
        orElse: () => null,
        empty: () => "Left form must not be empty",
      ),
      (r) => null,
    );
  }

  String? get rightFieldErrorMessage {
    return FormValidator.emptyValidator(rightValue)
        .andThen(
          () => FormValidator.customValidator(
            validator: operandCannotBeZeroValidator,
          ),
        )
        .fold(
          (failure) => failure.maybeWhen(
              orElse: () => null,
              empty: () => "Right form must not be empty",
              customError: () => 'Cannot be divided by zero'),
          (r) => null,
        );
  }

  bool get operandCannotBeZeroValidator =>
      type == const CalculatorType.divide() && double.parse(rightValue) == 0;
}
