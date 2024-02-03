import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/features/home/data/data_sources/local/save_password_db.dart';
import 'package:password_generator/features/home/data/models/save_password.dart';
import 'package:password_generator/features/home/domain/entities/save_password.dart';
import 'package:password_generator/features/home/domain/repository/save_password_repo.dart';

class SavePasswordRepositoryImpl implements SavePasswordRepository {
  final SavePasswordService _savePasswordService;
  SavePasswordRepositoryImpl(this._savePasswordService);
  @override
  Future<DataState<List<SavePasswordEntity>>> getAllSavedPasswords() async {
    try {
      final allPasswords = await _savePasswordService.getAllSavedPasswords();
      return DataSuccess(allPasswords);
    } catch (e) {
      return DataFailed(Exception(e));
    }
  }

  @override
  Future<DataState<SavePasswordEntity>> savePassword(
      {required SavePasswordModel savePassword}) async {
    try {
      final response = await _savePasswordService.savePassword(savePassword);
      return DataSuccess(response);
    } catch (e) {
      return DataFailed(Exception(e));
    }
  }

  @override
  Future<void> initilizeSavedPasswordDb() async {
    _savePasswordService.initializeDatabase();
  }
}
