import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/core/usecases/usecases.dart';
import 'package:password_generator/features/home/data/models/password_generate_model.dart';
import 'package:password_generator/features/home/data/repository/password_generator_impl.dart';
import 'package:password_generator/features/home/domain/entities/password_entity.dart';

class GeneratePasswordUseCase
    implements UseCase<DataState<PasswordEntity>, PasswordGenerate> {
  final PasswordGenerateRepositoryImpl _generateRepositoryImpl;
  GeneratePasswordUseCase(this._generateRepositoryImpl);
  @override
  Future<DataState<PasswordEntity>> call({PasswordGenerate? params}) async {
    return _generateRepositoryImpl.generatePassword(passwordGenerate: params!);
  }
}
