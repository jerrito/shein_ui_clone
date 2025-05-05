import 'package:dartz/dartz.dart';
import 'package:shein_ui_clone/core/errors/error.dart';
import 'package:shein_ui_clone/core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOut(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
