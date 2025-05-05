import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shein_ui_clone/core/errors/error.dart';
import 'package:shein_ui_clone/core/usecase/usecase.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/auth_state_change.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/google_sign_in.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/sign_in_email.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/sign_up_email.dart';
import '../../domain/usecases/sign_out.dart';

part 'authentication_event.dart'; // Generated part file linking events
part 'authentication_state.dart'; // Generated part file linking states

class AuthBloc extends Bloc<AuthenticationEvent, AuthState> {
  final SignUpWithEmail _signUpUseCase;
  final SignInWithEmail _signInUseCase;
  final SignOut _signOutUseCase;
  final GetAuthStateChanges _getAuthStateChangesUseCase;
  final GoogleSignInUseCase googleSignIn;
  StreamSubscription<User?>? _authStateSubscription;

  AuthBloc({
    required SignUpWithEmail signUpUseCase,
    required SignInWithEmail signInUseCase,
    required SignOut signOutUseCase,
    required GetAuthStateChanges getAuthStateChangesUseCase,
    required this.googleSignIn,
  })  : _signUpUseCase = signUpUseCase,
        _signInUseCase = signInUseCase,
        _signOutUseCase = signOutUseCase,
        _getAuthStateChangesUseCase = getAuthStateChangesUseCase,
        super(AuthInitial()) {
    // Start with Initial state
    // Listen to auth state changes immediately
    _authStateSubscription = _getAuthStateChangesUseCase(NoParams()).listen(
      (user) => add(_AuthUserChanged(user)), // Add internal event on change
    );

    on<AuthAppStarted>(_onAppStarted); // Handle initial check if needed
    on<_AuthUserChanged>(_onAuthUserChanged);
    on<AuthSignUpRequested>(_onSignUpRequested);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);

    on<GoogleSignInRequested>((event, emit) async {
      emit(AuthLoading());

      final result = await googleSignIn();

      result.fold((failure) => emit(AuthFailureState(failure.message)),
          (user) => emit(AuthAuthenticated(user)));
    });
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel(); // Cancel subscription on close
    return super.close();
  }

  // Optional: Handle initial app start if needed beyond stream
  void _onAppStarted(AuthAppStarted event, Emitter<AuthState> emit) {
    // The stream subscription handles the initial state, but you could
    // potentially check sync current user here if needed for immediate UI.
    // For now, we rely on the stream emission triggered by the constructor.
    print("AuthAppStarted: Handled by auth state stream.");
  }

  // Handles user changes from the stream
  void _onAuthUserChanged(_AuthUserChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      print("AuthBloc: User Authenticated - ${event.user!.uid}");
      emit(AuthAuthenticated(event.user!));
    } else {
      print("AuthBloc: User Unauthenticated");
      emit(AuthUnauthenticated());
    }
  }

  // Handles Sign Up Request
  Future<void> _onSignUpRequested(
      AuthSignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); // Show loading state
    final failureOrUser = await _signUpUseCase(SignUpParams(
      email: event.email,
      password: event.password,
      displayName: event.displayName,
    ));

    failureOrUser.fold(
        (failure) => emit(AuthFailureState(_mapFailureToMessage(failure))),
        (user) {
      // No need to explicitly emit AuthAuthenticated here,
      // the _AuthUserChanged handler will do it when the stream updates.
      print("AuthBloc: Sign Up Success for ${user.email}");
      // If immediate state change is desired before stream updates:
      // emit(AuthAuthenticated(user));
    });
  }

  // Handles Sign In Request
  Future<void> _onSignInRequested(
      AuthSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final failureOrUser = await _signInUseCase(SignInParams(
      email: event.email,
      password: event.password,
    ));

    failureOrUser.fold(
        (failure) => emit(AuthFailureState(_mapFailureToMessage(failure))),
        (user) {
      // Rely on _AuthUserChanged via stream
      print("AuthBloc: Sign In Success for ${user.email}");
      // If immediate state change is desired before stream updates:
      // emit(AuthAuthenticated(user));
    });
  }

  // Handles Sign Out Request
  Future<void> _onSignOutRequested(
      AuthSignOutRequested event, Emitter<AuthState> emit) async {
    // Optionally emit loading, but sign out is usually fast
    // emit(AuthLoading());
    final failureOrVoid = await _signOutUseCase(NoParams());

    failureOrVoid.fold((failure) {
      // Emit failure if sign out fails (less common)
      emit(AuthFailureState(_mapFailureToMessage(failure)));
      // Optionally re-emit current state if needed e.g. emit(state)
    }, (_) {
      // Rely on _AuthUserChanged via stream to emit AuthUnauthenticated
      print("AuthBloc: Sign Out Success");
    });
    // If immediate state change is desired before stream updates:
    // emit(AuthUnauthenticated());
  }

  // Helper to convert Failure objects to user-friendly messages
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
      case CacheFailure _:
      case AuthFailure _:
      case NetworkFailure _: // Handle specific failure types
        return failure.message;
      default:
        return 'An unexpected error occurred';
    }
  }
}
