import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/features/home/data/models/password_generate_model.dart';
import 'package:password_generator/features/home/domain/entities/password_entity.dart';

abstract class PasswordGenerateRepository {
  DataState<PasswordEntity> generatePassword(
      {required PasswordGenerate passwordGenerate});
}
