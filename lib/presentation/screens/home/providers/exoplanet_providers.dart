import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/init_dependencies.dart';

final exoplanetLocalDataSourceProvider =
    Provider<ExoplanetLocalDataSourceImpl>((ref) {
  return serviceLocator<ExoplanetLocalDataSourceImpl>();
});

final exoplanetsProvider =
    FutureProvider<Either<Failure, List<Exoplanet>>>((ref) async {
  final localDataSource = ref.watch(exoplanetLocalDataSourceProvider);
  await localDataSource.getRemoteExoplanets();
  return await localDataSource.getLocalExoplanets();
});

final getLocalExoplanetsProvider = Provider<GetLocalExoplanets>((ref) {
  return serviceLocator<GetLocalExoplanets>();
});

final localExoplanetsProvider =
    FutureProvider<Either<Failure, List<Exoplanet>>>((ref) async {
  final getLocalExoplanets = ref.watch(getLocalExoplanetsProvider);
  return await getLocalExoplanets(NoParams());
});

final getRemoteExoplanetsToSaveProvider =
    Provider<GetRemoteExoplanetsToSave>((ref) {
  return serviceLocator<GetRemoteExoplanetsToSave>();
});

final getRemoteExoplanetsToSaveProviderCaller =
    FutureProvider<Either<Failure, void>>((ref) async {
  final getRemoteExoplanetsToSave =
      ref.watch(getRemoteExoplanetsToSaveProvider);
  return await getRemoteExoplanetsToSave.call(NoParams());
});
