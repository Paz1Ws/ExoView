import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/failures/exceptions.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';

class ExoplanetLocalRepositoryImpl implements LocalExoplanetRepository {
  final ExoplanetLocalDataSource localDataSource;

  ExoplanetLocalRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets() {
    return localDataSource.getLocalExoplanets();
  }

  @override
  void getRemoteExoplanets() async {
    await localDataSource.getRemoteExoplanets;
  }

  @override
  void storeExoplanets() async {
    await localDataSource.storeExoplanets;
  }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDate(
  //     DateTime exoDate) {
  //   // TODO: implement getExoplanetByDate
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDensity(
  //     double minDensity, double maxDensity) {
  //   // TODO: implement getExoplanetByDensity
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryMethod(
  //     String exoDiscoveryMethod) {
  //   // TODO: implement getExoplanetByDiscoveryMethod
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDiscoveryYear(
  //     double minYear, double maxYear) {
  //   // TODO: implement getExoplanetByDiscoveryYear
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByDistance(
  //     double minDist, double maxDist) {
  //   // TODO: implement getExoplanetByDistance
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByMass(double exoMass) {
  //   // TODO: implement getExoplanetByMass
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByName(String exoName) {
  //   // TODO: implement getExoplanetByName
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByTemperature(
  //     double minTemperature, double maxTemperature) {
  //   // TODO: implement getExoplanetByTemperature
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, List<Exoplanet?>>> getExoplanetByType(String exoType) {
  //   // TODO: implement getExoplanetByType
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, void>> addExoplanetToFavorites() {
  //   // TODO: implement addExoplanetToFavorites
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, void>> removeExoplanetFromFavorites(String id) {
  //   // TODO: implement removeExoplanetFromFavorites
  //   throw UnimplementedError();
  // }
}
