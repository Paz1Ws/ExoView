import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class ExoplanetRepository {
  // EXOPLANET REQUESTS
  Future<Either<Failure, List<Exoplanet>>> getExoplanets();
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByName(String exoName);

  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(String exoType);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDate(
      DateTime exoDate);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDistance(
      String exoDistance);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByMass(String exoMass);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByTemperature(
      String exoTemperature);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDensity(
      String exoDensity);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryYear(
      String exoDiscoveryYear);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod);
  // FAVORITE EXOPLANETS FUNCTIONS
  Future<Either<Failure, void>> addExoplanetToFavorites();
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id);
}
