import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/features/home/data/data_sources/local/save_password_db.dart';
import 'package:password_generator/features/home/data/models/password_generate_model.dart';
import 'package:password_generator/features/home/domain/use_cases/generate_pass_usecese/generate_pass_usecese.dart';
import 'package:password_generator/features/home/domain/use_cases/initialize_db_usecase/initialize_db_usecase.dart';

import '../../../data/repository/save_password_repo_impl.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GeneratePasswordUseCase _useCase;
  HomeBloc(this._useCase) : super(HomeState.initial()) {
    on<_ToggleLowerCase>(toggleLowerCase);
    on<_ToggleUpperCase>(toggleUpperCase);
    on<_ToggleNumbers>(toggleNumbers);
    on<_ToggleSpecialChars>(toggleSpecialChars);
    on<_UpdateLength>(updateLength);
    on<_GeneratePassword>(generatePassword);
  }

  FutureOr<void> toggleLowerCase(event, Emitter<HomeState> emit) {
    final newState = state.copyWith(lowerCase: !state.lowerCase);
    emit(newState);
  }

  FutureOr<void> toggleUpperCase(event, Emitter<HomeState> emit) {
    final newState = state.copyWith(uppercase: !state.uppercase);
    emit(newState);
  }

  FutureOr<void> toggleNumbers(event, Emitter<HomeState> emit) {
    final newState = state.copyWith(numbers: !state.numbers);
    emit(newState);
  }

  FutureOr<void> toggleSpecialChars(event, Emitter<HomeState> emit) {
    final newState = state.copyWith(specialChars: !state.specialChars);
    emit(newState);
  }

  FutureOr<void> updateLength(event, Emitter<HomeState> emit) {
    if (event.isIncrease) {
      emit(state.copyWith(length: (state.length) + 1));
    } else if (state.length >= 5) {
      emit(state.copyWith(length: (state.length) - 1));
    }
  }

  FutureOr<void> generatePassword(event, Emitter<HomeState> emit) async {
    final response = await _useCase(params: event.queries);
    if (response is DataSuccess) {
      emit(state.copyWith(password: response.data!.password));

      InitilizeDbUseCase(SavePasswordRepositoryImpl(SavePasswordService()))
          .call();
    }
  }
}
