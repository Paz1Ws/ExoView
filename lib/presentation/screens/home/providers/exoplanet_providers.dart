import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/init_dependencies.dart';

final exoplanetRepositoryProvider = Provider<ExoplanetRepositoryImpl>((ref) {
  return serviceLocator<ExoplanetRepositoryImpl>();
});

final exoplanetsProvider =
    Provider<Future<Either<Failure, List<Exoplanet>>>>((ref) {
  final exoplanetRepository = ref.watch(exoplanetRepositoryProvider);
  return GetExoplanets(exoplanetRepository)
      .exoplanetRepository
      .getExoplanets(null);
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
