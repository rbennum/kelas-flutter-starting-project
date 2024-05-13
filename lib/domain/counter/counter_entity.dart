import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_entity.freezed.dart';

@freezed
class CounterEntity with _$CounterEntity {
  const factory CounterEntity({required int counter}) = _CounterEntity;

  factory CounterEntity.initial() => const CounterEntity(counter: 0);
}
