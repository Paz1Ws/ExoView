import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:myapp/config/network/connection_checker.dart';
import 'package:myapp/config/secrets/app_secrets.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
 
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  serviceLocator.registerFactory(() => InternetConnection());
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );
   _initAuth();
}

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
   
  // Usecases
  ..registerFactory(
    () => SignUp(
      serviceLocator(),
    ),
  ) ..registerFactory(
    () => SignIn(
      serviceLocator(),
    ),
  );
}
