import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';
import 'package:student_lecture_app/domain/to_do/to_do_history_entity.dart';
import 'package:student_lecture_app/domain/to_do/to_do_history_type.dart';

part 'to_do_entity.freezed.dart';
part 'to_do_entity.g.dart';

@freezed
class ToDoEntity with _$ToDoEntity {
  const ToDoEntity._();

  const factory ToDoEntity({
    required int id,
    required String text,
    required List<ToDoHistoryEntity> historyList,
    required ToDoHistoryType type,
  }) = _ToDoEntity;

  factory ToDoEntity.Empty() => const ToDoEntity(
        id: 0,
        text: '',
        historyList: [],
        type: ToDoHistoryType.All(),
      );

  factory ToDoEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoEntityFromJson(json);

  Either<FormFailure, Unit> get _emptyTextValidator =>
      FormValidator.emptyValidator(text.trim());

  Option<FormFailure> get failureOption {
    return _emptyTextValidator
        .andThen(
          () => FormValidator.customValidator(validator: _noDuplicateTaskRule),
        )
        .fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }

  bool get _noDuplicateTaskRule => historyList.any((element) =>
      element.text.trim().toLowerCase() == text.trim().toLowerCase());

  Either<String, Unit> get _emptyTaskErrorMessage => _emptyTextValidator.fold(
        (failure) => failure.maybeWhen(
            orElse: () => right(unit),
            empty: () => left("Empty task is not allowed")),
        (_) => right(unit),
      );

  Either<String, Unit> get _duplicatedTaskErrorMessage =>
      FormValidator.customValidator(validator: _noDuplicateTaskRule).fold(
        (failure) => failure.maybeWhen(
          orElse: () => right(unit),
          customError: () => left("Cannot add the same value text"),
        ),
        (_) => right(unit),
      );

  String? get errorMessage => _emptyTaskErrorMessage
      .andThen(() => _duplicatedTaskErrorMessage)
      .fold((message) => message, (_) => null);

  List<ToDoHistoryEntity> removeTask(ToDoHistoryEntity model) {
    final newHistoryList = [...historyList];
    newHistoryList.removeWhere((element) => element == model);
    return newHistoryList;
  }
}
