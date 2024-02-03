import 'package:password_generator/core/resources/data_state.dart';
import 'package:password_generator/core/usecases/usecases.dart';
import 'package:password_generator/features/home/data/models/save_password.dart';
import 'package:password_generator/features/home/domain/entities/save_password.dart';
import 'package:password_generator/features/home/domain/repository/save_password_repo.dart';

class SavePasswordUseCase
    implements UseCase<DataState<SavePasswordEntity>, SavePasswordModel> {
  final SavePasswordRepository _passwordRepository;
  SavePasswordUseCase(this._passwordRepository);

  @override
  Future<DataState<SavePasswordEntity>> call({SavePasswordModel? params}) {
    return _passwordRepository.savePassword(savePassword: params!);
  }
}
