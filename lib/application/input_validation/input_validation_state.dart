import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/input_validation/input_validation_entity.dart';

part 'input_validation_state.freezed.dart';

@freezed
class InputValidationState with _$InputValidationState {
  const InputValidationState._();

  const factory InputValidationState(
      {required InputValidationEntity entity,
      required bool showError,
      required bool isValid}) = _InputValidationState;

  factory InputValidationState.initial() => InputValidationState(
      entity: InputValidationEntity.empty(), showError: false, isValid: false);

  InputValidationState get unmodified => copyWith(isValid: false);

  String? get showNameError => showError ? entity.nameErrorMessage : null;
  String? get showEmailError => showError ? entity.emailErrorMessage : null;

  String get title {
    if (!isValid) return "Hi There!";
    return "Hi ${entity.name}!";
  }

  String get description {
    if (!isValid) return "Please enter your name and email :)";
    return "Your email was ${entity.email} :)";
  }
}
