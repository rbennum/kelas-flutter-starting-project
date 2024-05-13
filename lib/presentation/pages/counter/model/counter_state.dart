import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/counter/counter_entity.dart';

part 'counter_state.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const CounterState._();
  const factory CounterState({required CounterEntity entity}) = _CounterState;

  factory CounterState.initial() => CounterState(entity: CounterEntity.initial());

  CounterState get increment => CounterState(
      entity: entity.copyWith(counter: entity.counter + 1)
  );
  CounterState get decrement => CounterState(
      entity: entity.copyWith(counter: entity.counter - 1)
  );
}
