import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class LocalExoplanetRepository {
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets();
  void storeExoplanets();
  void getRemoteExoplanets();
}
