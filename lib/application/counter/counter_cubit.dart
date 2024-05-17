import 'package:bloc/bloc.dart';
import 'package:student_lecture_app/application/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void get increment => emit(state.increment);
  void get decrement => emit(state.decrement);
}
