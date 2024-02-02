import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/features/home/data/data_sources/password_generate_service.dart';
import 'package:password_generator/features/home/data/models/password_generate_model.dart';
import 'package:password_generator/features/home/domain/entities/password_entity.dart';
import 'package:password_generator/features/home/domain/repository/password_generate_repo.dart';

class PasswordGenerateRepositoryImpl implements PasswordGenerateRepository {
  final PasswordGenerateService _generateService;
  PasswordGenerateRepositoryImpl(this._generateService);
  @override
  DataState<PasswordEntity> generatePassword(
      {required PasswordGenerate passwordGenerate}) {
    final password =
        _generateService.generatePassword(passwordGenerate: passwordGenerate);
    return DataSuccess(password);
  }
}
