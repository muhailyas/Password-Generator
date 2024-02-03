import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/features/home/data/models/save_password.dart';
import 'package:password_generator/features/home/domain/entities/save_password.dart';

abstract class SavePasswordRepository {
  Future<DataState<SavePasswordEntity>> savePassword(
      {required SavePasswordModel savePassword});
  Future<DataState<List<SavePasswordEntity>>> getAllSavedPasswords();
  Future<void> initilizeSavedPasswordDb();
}
