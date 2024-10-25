import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class ExoplanetRepository {
  // EXOPLANET REQUESTS
  Future<Either<Failure, List<Exoplanet>>> getExoplanets(String? url);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDate(
      DateTime exoDate);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDensity(
      double minDensity, double maxDensity);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryYear(
      double minYear, double maxYear);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDistance(
      double minDist, double maxDist);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByMass(double exoMass);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByName(String exoName);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByTemperature(
      double minTemperature, double maxTemperature);
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(String exoType);
  // FAVORITE EXOPLANETS FUNCTIONS
  Future<Either<Failure, void>> addExoplanetToFavorites();
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id);
}
