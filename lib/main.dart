import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shein_ui_clone/core/widgets/base.dart';
import 'package:shein_ui_clone/core/widgets/theme/theme.dart';
import 'package:shein_ui_clone/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:shein_ui_clone/features/authentication/presentation/pages/login.dart';
import 'package:shein_ui_clone/features/authentication/presentation/pages/signup.dart';
import 'package:shein_ui_clone/features/settings/presentation/pages/settings.dart';
import 'package:shein_ui_clone/firebase_options.dart';
import 'package:shein_ui_clone/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init(); // Initialize the service locator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide the AuthBloc at the top of the widget tree
    return BlocProvider<AuthBloc>(
      create: (_) => sl<AuthBloc>()
        ..add(AuthAppStarted()), // Initial event trigger (optional)
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) => const AuthWrapper(),
              );
            case '/settings':
              return MaterialPageRoute(
                builder: (_) => const SheinSettingsScreen(),
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => const SheinSignupScreen(),
              );
            case '/home':
              return MaterialPageRoute(
                builder: (_) => const SheinAppBase(currentIndex: 0),
              );
            default:
              return null;
          }
        },
        title: 'Firebase Auth Clean BLoC',
        theme: SheinTheme.sheinTheme,
        home: const AuthWrapper(), // Start with a wrapper to check auth state
        debugShowCheckedModeBanner: false, // Optional: remove debug banner
      ),
    );
  }
}

// Widget that listens to AuthBloc state and shows appropriate screen
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          print("AuthWrapper: Showing HomePage for ${state.user.uid}");
          return const SheinAppBase(
            currentIndex: 0,
          ); // User is logged in
        } else if (state is AuthUnauthenticated ||
            state is AuthFailureState ||
            state is AuthInitial) {
          // If AuthInitial is brief, showing SignInPage is okay.
          // Otherwise, show a splash/loading screen during AuthInitial.
          print("AuthWrapper: Showing SignInPage");
          return const SheinLoginScreen(); // User is not logged in or error occurred
        } else {
          // Typically AuthLoading state, show a loading indicator
          print("AuthWrapper: Showing Loading Indicator");
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
