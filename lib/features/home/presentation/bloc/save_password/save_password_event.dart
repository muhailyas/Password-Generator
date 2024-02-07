part of 'save_password_bloc.dart';

@freezed
class SavePasswordEvent with _$SavePasswordEvent {
  const factory SavePasswordEvent.started() = _Started;
  const factory SavePasswordEvent.savePassword(
      {required SavePasswordEntity savePassword}) = _SavePassword;
  const factory SavePasswordEvent.getAllPasswords() = _GetAllPasswords;
  const factory SavePasswordEvent.deletePassword({required int id}) =
      _DeletePassword;
  const factory SavePasswordEvent.initializeSavedDb() = _InitializeDb;
}
