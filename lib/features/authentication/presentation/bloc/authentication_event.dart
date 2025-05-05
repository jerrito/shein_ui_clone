part of 'authentication_bloc.dart'; // Links to the BLoC file

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

// Event triggered when the app starts or auth state needs checking
class AuthAppStarted extends AuthenticationEvent {}

// Event triggered by the auth state stream listener
class _AuthUserChanged extends AuthenticationEvent {
  final User? user;
  const _AuthUserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

// Event to request sign up
class AuthSignUpRequested extends AuthenticationEvent {
  final String email;
  final String password;
  final String? displayName; // Optional

  const AuthSignUpRequested(
      {required this.email, required this.password, this.displayName});

  @override
  List<Object?> get props => [email, password, displayName];
}

// Event to request sign in
class AuthSignInRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const AuthSignInRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

// Event to request sign out
class AuthSignOutRequested extends AuthenticationEvent {}
