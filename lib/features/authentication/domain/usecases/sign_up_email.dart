import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shein_ui_clone/core/errors/error.dart';
import 'package:shein_ui_clone/core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class SignUpWithEmail extends UseCase<User, SignUpParams> {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await repository.signUpWithEmailPassword(
      email: params.email,
      password: params.password,
      displayName: params.displayName,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String? displayName;

  const SignUpParams(
      {required this.email, required this.password, this.displayName});

  @override
  List<Object?> get props => [email, password, displayName];
}
