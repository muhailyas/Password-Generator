part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String password,
    required bool numbers,
    required bool lowerCase,
    required bool uppercase,
    required bool specialChars,
    required int length,
  }) = HomePageState;
  factory HomeState.initial() => const HomeState(
        password: '',
        numbers: false,
        lowerCase: false,
        uppercase: false,
        specialChars: false,
        length: 5,
      );
}
