import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class LocalExoplanetRepository {
  void getRemoteExoplanets();
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets();

  void storeExoplanets(List<Exoplanet> exoplanets);
}
