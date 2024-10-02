import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/init_dependencies.dart';

final exoplanetRepositoryProvider = Provider<ExoplanetRepository>((ref) {
  return serviceLocator<ExoplanetRepository>();
});

final exoplanetsProvider = Provider<GetExoplanets>((ref) {
  return GetExoplanets(ref.watch(exoplanetRepositoryProvider));
});
