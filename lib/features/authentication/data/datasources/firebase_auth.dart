import 'package:firebase_auth/firebase_auth.dart';
import 'package:shein_ui_clone/core/errors/error.dart';

abstract class FirebaseAuthDataSource {
  Stream<User?> get authStateChanges;
  User? get currentUser;
  Future<User> signUpWithEmailPassword({
    required String email,
    required String password,
    String? displayName,
  });
  Future<User> signInWithEmailPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthDataSourceImpl({required this.firebaseAuth});

  @override
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  @override
  User? get currentUser => firebaseAuth.currentUser;

  @override
  Future<User> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        throw const AuthFailure('Sign in failed: User data not available.');
      }
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromFirebaseAuthException(e.code);
    } catch (e) {
      // Catch any other unexpected errors
      throw ServerFailure('Sign in failed: ${e.toString()}');
    }
  }

  @override
  Future<User> signUpWithEmailPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        throw const AuthFailure('Sign up failed: User data not available.');
      }
      // Optionally update display name right after sign up
      if (displayName != null && displayName.isNotEmpty) {
        await userCredential.user!.updateDisplayName(displayName);
        // Reload user to get updated info (optional, depends on immediate need)
        // await userCredential.user!.reload();
        // return firebaseAuth.currentUser!; // Return potentially updated user
      }
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromFirebaseAuthException(e.code);
    } catch (e) {
      throw ServerFailure('Sign up failed: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromFirebaseAuthException(e.code);
    } catch (e) {
      throw ServerFailure('Sign out failed: ${e.toString()}');
    }
  }
}
