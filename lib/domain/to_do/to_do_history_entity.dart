import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_history_entity.freezed.dart';
part 'to_do_history_entity.g.dart';

@freezed
class ToDoHistoryEntity with _$ToDoHistoryEntity {
  const ToDoHistoryEntity._();

  const factory ToDoHistoryEntity({
    required int id,
    required String text,
    required bool isDone,
  }) = _ToDoHistoryEntity;

  factory ToDoHistoryEntity.NewEntity({
    required String text,
  }) =>
      ToDoHistoryEntity(
        id: Random().nextInt(10000),
        text: text,
        isDone: false,
      );

  factory ToDoHistoryEntity.Empty() => const ToDoHistoryEntity(
        id: 0,
        text: '',
        isDone: false,
      );

  factory ToDoHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoHistoryEntityFromJson(json);
}
