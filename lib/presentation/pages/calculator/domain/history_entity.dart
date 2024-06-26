import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/calculator_type.dart';

part 'history_entity.freezed.dart';

@freezed
class HistoryEntity with _$HistoryEntity {
  const HistoryEntity._();

  const factory HistoryEntity({
    required int id,
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
  }) = _HistoryEntity;

  factory HistoryEntity.newEntity({
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
  }) =>
      HistoryEntity(
        id: Random().nextInt(10000),
        leftValue: leftValue,
        rightValue: rightValue,
        type: type,
      );
}
