import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/errors/error.dart';

class GoogleSignInUseCase {
  final AuthRepository repository;

  GoogleSignInUseCase(this.repository);

  Future<Either<Failure, User>> call() async {
    return await repository.signInWithGoogle();
  }
}
