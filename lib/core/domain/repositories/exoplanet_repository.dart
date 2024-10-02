import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';

abstract interface class ExoplanetRepository {
  // EXOPLANET REQUESTS
  Future<Either<Failure, List<ExoplanetEntity>>> getExoplanets();
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByName(String exoName);

  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByType(String exoType);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDate(DateTime exoDate);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDistance(String exoDistance);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByMass(String exoMass);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByTemperature(
      String exoTemperature);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDensity(String exoDensity);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDiscoveryYear(
      String exoDiscoveryYear);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod);
  // FAVORITE EXOPLANETS FUNCTIONS
  Future<Either<Failure, void>> addExoplanetToFavorites(String id);
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id);
  Future<Either<Failure, void>> isExoplanetFavorite(String id);
}
