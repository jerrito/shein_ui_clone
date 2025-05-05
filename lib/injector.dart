import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shein_ui_clone/features/authentication/data/datasources/firebase_auth.dart';
import 'package:shein_ui_clone/features/authentication/data/repositories/auth_repository_imp.dart';
import 'package:shein_ui_clone/features/authentication/domain/repositories/auth_repository.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/auth_state_change.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/sign_in_email.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/sign_out.dart';
import 'package:shein_ui_clone/features/authentication/domain/usecases/sign_up_email.dart';
import 'package:shein_ui_clone/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance; // Service Locator instance

Future<void> init() async {
  // --- Features - Auth ---

  // Bloc (depends on UseCases) - Register as factory because it has state
  sl.registerFactory(() => AuthBloc(
        signUpUseCase: sl(),
        signInUseCase: sl(),
        signOutUseCase: sl(),
        getAuthStateChangesUseCase: sl(),
      ));

  // UseCases (depend on Repository) - Register as lazy singletons
  sl.registerLazySingleton(() => SignUpWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetAuthStateChanges(sl()));

  // Repository (depends on DataSource and NetworkInfo) - Register as lazy singleton
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        firebaseAuthDataSource: sl(),
        networkInfo: sl(), // Pass network info
      ));

  // DataSources (depend on external packages like FirebaseAuth) - Register as lazy singleton
  sl.registerLazySingleton<FirebaseAuthDataSource>(
      () => FirebaseAuthDataSourceImpl(firebaseAuth: sl()));

  // --- Core ---
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // --- External ---
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.createInstance());

  print('Dependency Injection Initialized');
}
