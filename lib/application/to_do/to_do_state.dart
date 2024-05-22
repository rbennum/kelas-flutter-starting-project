part of 'to_do_cubit.dart';

@freezed
class ToDoState with _$ToDoState {
  const ToDoState._();

  const factory ToDoState({
    required ToDoEntity model,
    required bool showError,
  }) = _ToDoState;

  factory ToDoState.Initial() => ToDoState(
        model: ToDoEntity.Empty(),
        showError: false,
      );

  ToDoState get unmodified => copyWith.model(id: 0);

  bool get isNewTask => model.id == 0;

  String? get getErrorMessage => showError ? model.errorMessage : null;
}
