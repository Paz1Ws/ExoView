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
}
