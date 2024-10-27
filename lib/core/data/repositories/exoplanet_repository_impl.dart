import 'package:myapp/config/entities/exoplanet.dart';
import 'package:myapp/config/failures/exceptions.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/network/connection_checker.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

class ExoplanetRepositoryImpl implements ExoplanetRepository {
  final ExoplanetRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;
  const ExoplanetRepositoryImpl(
    this.remoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<Exoplanet>>> getExoplanets(String? url) async {
    try {
      return await remoteDataSource.getExoplanets(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDate(
      DateTime exoDate) {
    // TODO: implement getExoplanetByDate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDensity(
      double minDensity, double maxDensity) {
    // TODO: implement getExoplanetByDensity
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod) {
    // TODO: implement getExoplanetByDiscoveryMethod
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryYear(
      double minYear, double maxYear) {
    // TODO: implement getExoplanetByDiscoveryYear
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDistance(
      double minDist, double maxDist) {
    // TODO: implement getExoplanetByDistance
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByMass(double exoMass) {
    // TODO: implement getExoplanetByMass
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByName(String exoName) {
    // TODO: implement getExoplanetByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByTemperature(
      double minTemperature, double maxTemperature) {
    // TODO: implement getExoplanetByTemperature
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(String exoType) {
    // TODO: implement getExoplanetByType
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addExoplanetToFavorites() {
    // TODO: implement addExoplanetToFavorites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id) {
    // TODO: implement removeExoplanetFromFavorites
    throw UnimplementedError();
  }
}
