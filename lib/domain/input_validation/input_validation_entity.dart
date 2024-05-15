import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';

import '../core/form_failure.dart';

part 'input_validation_entity.freezed.dart';

@freezed
class InputValidationEntity with _$InputValidationEntity {
  const InputValidationEntity._();

  const factory InputValidationEntity(
      {required String name, required String email}) = _InputValidationEntity;

  factory InputValidationEntity.empty() =>
      const InputValidationEntity(name: "", email: "");

  Option<FormFailure> get failureOption => FormValidator.emptyValidator(name)
      .andThen(() => FormValidator.emailValidator(email))
      .fold((failure) => some(failure), (_) => none());

  String? get emailErrorMessage => FormValidator.emailValidator(email).fold(
      (failure) => failure.maybeWhen(
          orElse: () => null,
          empty: () => "Email must not be empty",
          tooLong: () => "Email is too long",
          invalidEmailAddress: () => "Invalid email address"),
      (data) => null);

  String? get nameErrorMessage => FormValidator.emptyValidator(name).fold(
      (failure) => failure.maybeWhen(
          orElse: () => null, empty: () => "Name must not be empty"),
      (data) => null);
}
