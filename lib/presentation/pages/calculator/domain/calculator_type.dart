import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_type.freezed.dart';

@freezed
class CalculatorType with _$CalculatorType {
  const factory CalculatorType.none() = _CalculatorTypeNone;
  const factory CalculatorType.add() = _CalculatorTypeAdd;
  const factory CalculatorType.subtract() = _CalculatorTypeSubtract;
  const factory CalculatorType.multiply() = _CalculatorTypeMultiply;
  const factory CalculatorType.divide() = _CalculatorTypeDivide;
  const factory CalculatorType.pow() = _CalculatorTypePow;
}
