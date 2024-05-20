part of 'calculator_cubit.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const CalculatorState._();
  const factory CalculatorState({
    required CalculatorEntity model,
    required bool showError,
  }) = _CalculatorState;
  factory CalculatorState.Empty() => CalculatorState(
        model: CalculatorEntity.empty(),
        showError: false,
      );

  CalculatorState get unmodified => copyWith(
        model: model.copyWith(
          isPressed: false,
        ),
      );

  bool isSelectedType(CalculatorType type) => model.type == type;

  String operatorSymbol(CalculatorType type) {
    return type.when(
      none: () => '',
      add: () => '+',
      subtract: () => '-',
      multiply: () => '*',
      divide: () => '/',
      pow: () => '^',
    );
  }

  String get errorMessage {
    if (!showError) return 'Press the calculate button to get the result';
    if (model.leftFieldErrorMessage != null) {
      return model.leftFieldErrorMessage!;
    }
    return model.rightFieldErrorMessage ?? '';
  }

  String historyText(HistoryEntity entity) {
    return "${entity.leftValue} ${operatorSymbol(entity.type)} ${entity.rightValue}";
  }
}
