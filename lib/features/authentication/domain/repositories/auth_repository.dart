import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show User; // Use firebase User directly
import 'package:shein_ui_clone/core/errors/error.dart';

abstract class AuthRepository {
  // Stream to listen for auth state changes (logged in/out)
  Stream<User?> get authStateChanges;

  // Get current user sync
  User? get currentUser;

  // Sign up with email and password
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String email,
    required String password,
    String? displayName, // Optional
  });

  // Sign in with email and password
  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  // Sign out
  Future<Either<Failure, void>> signOut();

  // Optional: Send password reset email
  // Future<Either<Failure, void>> sendPasswordResetEmail({required String email});

  Future<Either<Failure, User>> signInWithGoogle();
}
