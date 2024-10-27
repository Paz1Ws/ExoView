import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class ExoplanetRepository {
  // EXOPLANET REQUESTS
  Future<Either<Failure, List<Exoplanet>>> getExoplanets(String? url);
}
