import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_lecture_app/application/counter/counter_cubit.dart';
import 'package:student_lecture_app/application/counter/counter_state.dart';
import 'package:student_lecture_app/domain/counter/counter_entity.dart';

class MockCounterCubit extends MockCubit<CounterState>
    implements CounterCubit {}

void main() {
  test_counter_cubit();
}

void test_counter_cubit() {
  group(
    'CounterCubit',
    () {
      blocTest<CounterCubit, CounterState>(
        'returns empty array when there are no functions called',
        build: () => CounterCubit(),
        expect: () => [],
      );

      blocTest(
        'emits [1] when the increment method is called',
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment,
        expect: () => [const CounterState(entity: CounterEntity(counter: 1))],
      );

      blocTest(
        'emits [-1] when the decrement method is called',
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement,
        expect: () => [const CounterState(entity: CounterEntity(counter: -1))],
      );

      blocTest(
        'emits [0] when the decrement and increment method is called in sequence',
        build: () => CounterCubit(),
        act: (cubit) {
          cubit.decrement;
          cubit.increment;
        },
        expect: () => [
          const CounterState(entity: CounterEntity(counter: -1)),
          const CounterState(entity: CounterEntity(counter: 0)),
        ],
      );
    },
  );
}
