import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:student_lecture_app/domain/to_do/to_do_entity.dart';
import 'package:student_lecture_app/domain/to_do/to_do_history_entity.dart';
import 'package:student_lecture_app/domain/to_do/to_do_history_type.dart';

part 'to_do_cubit.freezed.dart';
part 'to_do_state.dart';

class ToDoCubit extends HydratedCubit<ToDoState> {
  ToDoCubit() : super(ToDoState.Initial()) {
    inputController = TextEditingController()..addListener(onInputTextChanges);
    setHistoryType(const ToDoHistoryType.All());
  }

  late TextEditingController inputController;

  @override
  ToDoState? fromJson(Map<String, dynamic> json) {
    return ToDoState(
      model: ToDoEntity.fromJson(json),
      showError: false,
    );
  }

  @override
  Map<String, dynamic>? toJson(ToDoState state) {
    return state.model.toJson();
  }

  void onInputTextChanges() {
    emit(state.copyWith.model(text: inputController.text));
  }

  void setHistoryType(ToDoHistoryType type) {
    emit(state.unmodified.copyWith.model(type: type));
  }

  void submit() {
    state.model.failureOption.fold(
      () {
        if (state.isNewTask) {
          final newTask = ToDoHistoryEntity.NewEntity(text: state.model.text);
          emit(
            state.unmodified.copyWith(showError: false).copyWith.model(
              historyList: [...state.model.historyList, newTask],
            ),
          );
        } else {}
        inputController.clear();
      },
      (failure) => emit(
        state.unmodified.copyWith(
          showError: true,
        ),
      ),
    );
  }

  void deleteTask(ToDoHistoryEntity model) {
    emit(
      state.unmodified.copyWith.model(
        historyList: state.model.removeTask(model),
      ),
    );
  }
}
