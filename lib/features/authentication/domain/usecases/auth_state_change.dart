import 'package:firebase_auth/firebase_auth.dart';
import 'package:shein_ui_clone/core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class GetAuthStateChanges extends StreamUseCase<User?, NoParams> {
  final AuthRepository repository;

  GetAuthStateChanges(this.repository);

  @override
  Stream<User?> call(NoParams params) {
    return repository.authStateChanges;
  }
}
