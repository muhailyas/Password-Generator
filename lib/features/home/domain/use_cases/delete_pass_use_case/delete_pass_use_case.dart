import 'package:password_generator/core/usecases/usecases.dart';
import 'package:password_generator/features/home/domain/repository/save_password_repo.dart';

// class DeletePasswordUseCase implements UseCase<void, int?> {
//   final SavePasswordRepository _passwordRepository;
//   DeletePasswordUseCase(this._passwordRepository);
//   @override
//   Future<void> call(int? id) async {
//     _passwordRepository.deletePassword(id: id!);
//     return;
//   }
// }
class DeletePasswordUseCase implements UseCase<void, int> {
  final SavePasswordRepository _passwordRepository;
  DeletePasswordUseCase(this._passwordRepository);
  @override
  Future<void> call({int? params}) {
    return _passwordRepository.deletePassword(id: params!);
  }
}
