part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.toggleLowerCase() = _ToggleLowerCase;
  const factory HomeEvent.toggleUpperCase() = _ToggleUpperCase;
  const factory HomeEvent.toggleNumbers() = _ToggleNumbers;
  const factory HomeEvent.toggleSpecialChars() = _ToggleSpecialChars;
  const factory HomeEvent.updateLength({required bool isIncrease}) =
      _UpdateLength;
  const factory HomeEvent.generatePassword(
      {required PasswordGenerate queries}) = _GeneratePassword;
}
