import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show User, FirebaseAuthException;
import 'package:shein_ui_clone/core/errors/error.dart';
import 'package:shein_ui_clone/features/authentication/data/datasources/firebase_auth.dart';
import '../../../../core/network/network_info.dart'; // Optional network check
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;
  final NetworkInfo? networkInfo; // Make optional or required based on need

  AuthRepositoryImpl({
    required this.firebaseAuthDataSource,
    this.networkInfo,
  });

  @override
  Stream<User?> get authStateChanges => firebaseAuthDataSource.authStateChanges;

  @override
  User? get currentUser => firebaseAuthDataSource.currentUser;

  @override
  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    // Optional: Check network connection first
    if (networkInfo != null && !(await networkInfo!.isConnected)) {
      return Left(NetworkFailure('No internet connection.'));
    }
    try {
      final user = await firebaseAuthDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on AuthFailure catch (e) {
      // Catch specific AuthFailure from datasource
      return Left(e);
    } on ServerFailure catch (e) {
      // Catch general server failures
      return Left(e);
    } catch (e) {
      // Catch any other unexpected errors during repo logic
      return Left(
          ServerFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    if (networkInfo != null && !(await networkInfo!.isConnected)) {
      return Left(NetworkFailure('No internet connection.'));
    }
    try {
      final user = await firebaseAuthDataSource.signUpWithEmailPassword(
        email: email,
        password: password,
        displayName: displayName,
      );
      return Right(user);
    } on AuthFailure catch (e) {
      return Left(e);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
          ServerFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    // No network check needed for local sign out usually,
    // but might be needed if backend cleanup is involved.
    try {
      await firebaseAuthDataSource.signOut();
      return const Right(null); // Indicate success with void
    } on AuthFailure catch (e) {
      return Left(e);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
          ServerFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthDataSource.signInWithGoogle();
      return Right(user);
    } on AuthFailure catch (failure) {
      return Left(failure);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }
}
