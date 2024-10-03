import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/config/failures/exceptions.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class ExoplanetRemoteDataSource {
  Future<Either<Failure, List<Exoplanet>>> getExoplanets();
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDate(
      DateTime exoDate);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDensity(
      String exoDensity);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDiscoveryMethod(
      String exoDiscoveryMethod);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDiscoveryYear(
      String exoDiscoveryYear);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByDistance(
      String exoDistance);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByMass(
      String exoMass);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByName(
      String exoName);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByTemperature(
      String exoTemperature);
  Future<Either<Failure, List<ExoplanetEntity?>>> getExoplanetByType(
      String exoType);
  Future<Either<Failure, void>> addExoplanetToFavorites();
  Future<Either<Failure, void>> removeExoplanetFromFavorites(String id);
}

class ExoplanetRemoteDataSourceImpl implements ExoplanetRemoteDataSource {
  @override
  Future<Either<Failure, List<Exoplanet>>> getExoplanets() async {
    try {
      var response = await http.get(AppSecrets.baseExoplanetUrl);

      if (response.statusCode == 200) {
        final List<Exoplanet> exoplanets = (jsonDecode(response.body) as List)
            .map((data) => Exoplanet.fromJson(data))
            .toList();
        return Right(exoplanets);
      } else {
        return Left(
            ServerException('Error fetching exoplanets: ${response.statusCode}')
                as Failure);
      }
    } on SocketException {
      return Left(Failure('No Internet connection'));
    } on FormatException {
      return Left(Failure('Bad response format'));
    } on HttpException {
      return Left(Failure('Unexpected HTTP error'));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
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
