part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial() = _Initial;

  final int counter;

  CounterState({required this.counter});

  CounterState increment() => counter + 1;
  void decrement() => counter - 1;
}
