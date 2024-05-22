import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_history_type.freezed.dart';
part 'to_do_history_type.g.dart';

@freezed
class ToDoHistoryType with _$ToDoHistoryType {
  const factory ToDoHistoryType.All() = _ToDoHistoryAll;
  const factory ToDoHistoryType.Done() = _ToDoHistoryDone;
  const factory ToDoHistoryType.NotDone() = _ToDoHistoryNotDone;

  factory ToDoHistoryType.fromJson(Map<String, dynamic> json) =>
      _$ToDoHistoryTypeFromJson(json);
}
