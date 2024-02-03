part of 'save_password_bloc.dart';

@freezed
class SavePasswordState with _$SavePasswordState {
  const factory SavePasswordState.initial() = _Initial;
  const factory SavePasswordState.passwordSavedSuccess() = PasswordSavedSuccess;
  const factory SavePasswordState.passwordSavedError() = PasswordSavedError;
  const factory SavePasswordState.passwordFetchLoading() = PasswordFetchLoading;
  const factory SavePasswordState.passwordFetchSuccess(
          {required List<SavePasswordEntity> savedPasswords}) =
      PasswordFetchSuccess;
  const factory SavePasswordState.passwordFetchError() = PasswordFetchError;
}
