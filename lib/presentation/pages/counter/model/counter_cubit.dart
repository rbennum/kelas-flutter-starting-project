import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/counter/counter_entity.dart';
import 'package:student_lecture_app/presentation/pages/counter/model/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void get increment => emit(state.increment);
  void get decrement => emit(state.decrement);
}
