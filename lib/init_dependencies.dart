import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:myapp/config/network/connection_checker.dart';
import 'package:myapp/config/secrets/app_secrets.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/data/datasources/favorites_data_source.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/core/domain/usecases/favorites/favorites_usecases.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseKey,
  );
  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  final box = await Hive.openBox('exoplanetsBox');

  // Registrar Hive Box
  serviceLocator.registerLazySingleton(() => box);

  // Registrar SupabaseClient
  serviceLocator.registerLazySingleton(() => supabase.client);

  // Registrar InternetConnectionChecker
  serviceLocator.registerLazySingleton(() => InternetConnection());

  // Registrar ConnectionChecker
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetLocalExoplanets(
      serviceLocator(),
    ),
  );

  serviceLocator
      .registerFactory(() => GetRemoteExoplanetsToSave(serviceLocator()));

  serviceLocator.registerFactory(() => ExoplanetLocalDataSourceImpl(
        serviceLocator(),
        serviceLocator(),
      ));
  serviceLocator.registerFactory(() => FavoritesRemoteDataSource(
        serviceLocator(),
        serviceLocator(),
      ));

  // Registrar FavoritesRepository
  serviceLocator.registerFactory(() => FavoritesRepositoryImpl(
        serviceLocator(),
      ));

  // Registrar Use Cases
  serviceLocator.registerFactory(() => AddFavorite(serviceLocator()));
  serviceLocator.registerFactory(() => RemoveFavorite(serviceLocator()));
  serviceLocator.registerFactory(() => AddFavoritesToLocal(serviceLocator()));
  serviceLocator.registerFactory(() => IsFavorite(serviceLocator()));
  serviceLocator.registerFactory(() => GetLocalFavorites(serviceLocator()));

  _initAuth();
}

void _initAuth() {
  // Datasources
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<ExoplanetRemoteDataSource>(
      () => ExoplanetRemoteDataSourceImpl(),
    )

    // Repositories
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepositoryImpl>(
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
    )
    ..registerFactory(
      () => SignIn(
        serviceLocator(),
      ),
    );
}
