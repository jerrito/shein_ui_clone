import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

// Authentication specific failures
class AuthFailure extends Failure {
  const AuthFailure(super.message);

  factory AuthFailure.fromFirebaseAuthException(String code) {
    switch (code) {
      case 'invalid-email':
        return const AuthFailure('Invalid email address format.');
      case 'user-disabled':
        return const AuthFailure('This user account has been disabled.');
      case 'user-not-found':
        return const AuthFailure('No user found for that email.');
      case 'wrong-password':
        return const AuthFailure('Incorrect password.');
      case 'email-already-in-use':
        return const AuthFailure('An account already exists for that email.');
      case 'operation-not-allowed':
        return const AuthFailure('Email/password accounts are not enabled.');
      case 'weak-password':
        return const AuthFailure('The password provided is too weak.');
      case 'requires-recent-login':
        return const AuthFailure(
            'This operation requires recent authentication. Please log in again.');
      default:
        // Log the unknown code for debugging
        print('Unknown FirebaseAuthException code: $code');
        return const AuthFailure(
            'An unexpected authentication error occurred.');
    }
  }
}
