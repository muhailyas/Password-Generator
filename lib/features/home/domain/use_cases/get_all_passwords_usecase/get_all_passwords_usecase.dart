import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/core/usecases/usecases.dart';
import 'package:password_generator/features/home/domain/entities/save_password.dart';
import 'package:password_generator/features/home/domain/repository/save_password_repo.dart';

class GetAllSavedPasswordsUseCase
    implements UseCase<DataState<List<SavePasswordEntity>>, void> {
  final SavePasswordRepository _passwordRepository;
  GetAllSavedPasswordsUseCase(this._passwordRepository);

  @override
  Future<DataState<List<SavePasswordEntity>>> call({void params}) {
    return _passwordRepository.getAllSavedPasswords();
  }
}
