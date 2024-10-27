import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';

class LocalExoplanetRepositoryImpl implements LocalExoplanetRepository {
  final Box box;
  final GetExoplanets getExoplanetsUseCase;

  LocalExoplanetRepositoryImpl(this.box, this.getExoplanetsUseCase);

  @override
  void getRemoteExoplanets() async {
    final result = await getExoplanetsUseCase(NoParams());

    result.fold(
      (failure) => Left(failure),
      (exoplanets) {
        storeExoplanets(exoplanets);
      },
    );
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
