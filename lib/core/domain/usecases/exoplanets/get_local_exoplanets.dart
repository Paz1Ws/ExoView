import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';

class GetLocalExoplanets implements UseCase<List<Exoplanet>, NoParams> {
  final ExoplanetLocalDataSourceImpl localExoplanetRepository;

  GetLocalExoplanets(this.localExoplanetRepository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    return await localExoplanetRepository.getLocalExoplanets();
  }
}

class GetRemoteExoplanetsToSave implements UseCase<void, NoParams> {
  final ExoplanetLocalDataSourceImpl localExoplanetRepository;

  GetRemoteExoplanetsToSave(this.localExoplanetRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return localExoplanetRepository.getRemoteExoplanets();
  }
}
