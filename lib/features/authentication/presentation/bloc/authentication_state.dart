part of 'authentication_bloc.dart'; // Links to the BLoC file

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial state before checking auth status
class AuthInitial extends AuthState {}

// State while an auth operation (sign in/up/out) is in progress
class AuthLoading extends AuthState {}

// State when the user is authenticated
class AuthAuthenticated extends AuthState {
  final User user; // Keep the Firebase User object

  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

// State when the user is not authenticated
class AuthUnauthenticated extends AuthState {}

// State when an authentication error occurs
class AuthFailureState extends AuthState {
  final String errorMessage;

  const AuthFailureState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
