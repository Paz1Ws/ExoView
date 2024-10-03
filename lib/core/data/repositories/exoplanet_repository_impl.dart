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
  Future<Either<Failure, List<Exoplanet>>> getExoplanets() async {
    try {
      return await remoteDataSource.getExoplanets();
      // if (await (connectionChecker.isConnected)) {

      // }
      // return left(Failure('An error ocurred trying to fetch exoplanets'));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addExoplanetToFavorites() {
    // TODO: implement addExoplanetToFavorites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDate(
      DateTime exoDate) {
    // TODO: implement getExoplanetByDate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDensity(
      String exoDensity) {
    // TODO: implement getExoplanetByDensity
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod) {
    // TODO: implement getExoplanetByDiscoveryMethod
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDiscoveryYear(
      String exoDiscoveryYear) {
    // TODO: implement getExoplanetByDiscoveryYear
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDistance(
      String exoDistance) {
    // TODO: implement getExoplanetByDistance
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByMass(
      String exoMass) {
    // TODO: implement getExoplanetByMass
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByName(
      String exoName) {
    // TODO: implement getExoplanetByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByTemperature(
      String exoTemperature) {
    // TODO: implement getExoplanetByTemperature
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByType(
      String exoType) {
    // TODO: implement getExoplanetByType
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id) {
    // TODO: implement removeExoplanetFromFavorites
    throw UnimplementedError();
  }
}
