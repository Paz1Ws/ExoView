import 'package:fpdart/fpdart.dart';

import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';

abstract interface class ExoplanetLocalDataSource {
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets();
  void storeExoplanets(List<Exoplanet> exoplanets);
  void getRemoteExoplanets();
}

class ExoplanetLocalDataSourceImpl implements ExoplanetLocalDataSource {
  final Box box;
  final GetExoplanets getExoplanetsUseCase;

  ExoplanetLocalDataSourceImpl(this.box, this.getExoplanetsUseCase);

  @override
  Future<Either<Failure, void>> getRemoteExoplanets() async {
    try {
      final exoplanets = await getExoplanetsUseCase(NoParams());
      if (exoplanets.isRight()) {
        exoplanets.fold(
          (failure) => Left(failure),
          (exoplanets) {
            print("Data charged");
            storeExoplanets(exoplanets);
          },
        );
        return Right(null);
      } else {
        return Left(Failure('Failed to get remote exoplanets'));
      }
    } catch (e) {
      return Left(Failure('Failed to get remote exoplanets: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalExoplanets() async {
    try {
      final exoplanetList = box.get('exoplanets') as List<dynamic>?;
      if (exoplanetList == null) {
        return Left(Failure('No exoplanets found'));
      }
      final exoplanets =
          exoplanetList.map((e) => Exoplanet.fromJson(e)).toList();
      return Right(exoplanets);
    } catch (e) {
      return Left(Failure('Failed to get local exoplanets'));
    }
  }

  @override
  void storeExoplanets(List<Exoplanet> exoplanets) {
    final exoplanetList = exoplanets.map((e) => e.toJson()).toList();
    box.put('exoplanets', exoplanetList);
  }
}
