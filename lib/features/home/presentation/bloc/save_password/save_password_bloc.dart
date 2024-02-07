import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/features/home/domain/entities/save_password.dart';
import 'package:password_generator/features/home/domain/use_cases/delete_pass_use_case/delete_pass_use_case.dart';
import 'package:password_generator/features/home/domain/use_cases/get_all_passwords_usecase/get_all_passwords_usecase.dart';
import 'package:password_generator/features/home/domain/use_cases/initialize_db_usecase/initialize_db_usecase.dart';
import 'package:password_generator/features/home/domain/use_cases/save_password_use_case/save_password_use_case.dart';
part 'save_password_event.dart';
part 'save_password_state.dart';
part 'save_password_bloc.freezed.dart';

class SavePasswordBloc extends Bloc<SavePasswordEvent, SavePasswordState> {
  final GetAllSavedPasswordsUseCase _getAllSavedPasswordsUseCase;
  final SavePasswordUseCase _savePasswordUseCase;
  final InitilizeDbUseCase _initilizeDbUseCase;
  final DeletePasswordUseCase _deletePasswordUseCase;
  SavePasswordBloc(this._getAllSavedPasswordsUseCase, this._savePasswordUseCase,
      this._initilizeDbUseCase, this._deletePasswordUseCase)
      : super(const _Initial()) {
    on<_SavePassword>(savePassword);
    on<_GetAllPasswords>(getAllPasswords);
    on<_InitializeDb>(initializeDb);
    on<_DeletePassword>(deletePassword);
  }

  FutureOr<void> savePassword(event, Emitter<SavePasswordState> emit) async {
    final response = await _savePasswordUseCase(params: event.savePassword);
    if (response is DataSuccess) {
      emit(const SavePasswordState.passwordSavedSuccess());
    } else {
      emit(const SavePasswordState.passwordSavedError());
    }
  }

  FutureOr<void> getAllPasswords(event, Emitter<SavePasswordState> emit) async {
    final response = await _getAllSavedPasswordsUseCase();

    if (response is DataSuccess) {
      emit(SavePasswordState.passwordFetchSuccess(
          savedPasswords: response.data!));
    } else {
      emit(const SavePasswordState.passwordFetchError());
    }
  }

  FutureOr<void> initializeDb(event, Emitter<SavePasswordState> emit) async {
    await _initilizeDbUseCase();
  }

  FutureOr<void> deletePassword(event, Emitter<SavePasswordState> emit) async {
    await _deletePasswordUseCase(params: event.id);
    emit(const DeleteSuccess());
  }
}
