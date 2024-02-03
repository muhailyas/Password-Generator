import 'package:password_generator/core/usecases/usecases.dart';
import 'package:password_generator/features/home/domain/repository/save_password_repo.dart';

class InitilizeDbUseCase implements UseCase<void, void> {
  final SavePasswordRepository _passwordRepository;
  InitilizeDbUseCase(this._passwordRepository);
  @override
  Future<void> call({void params}) async {
    await _passwordRepository.initilizeSavedPasswordDb();
  }
}
