import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';

class GetLocalExoplanets implements UseCase<List<Exoplanet>, NoParams> {
  final LocalExoplanetRepositoryImpl localExoplanetRepository;

  GetLocalExoplanets(this.localExoplanetRepository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    return await localExoplanetRepository.getLocalExoplanets();
  }
}

class GetRemoteExoplanetsToSave {
  final LocalExoplanetRepositoryImpl localExoplanetRepository;

  GetRemoteExoplanetsToSave(this.localExoplanetRepository);

  void call() async {
    await localExoplanetRepository.getRemoteExoplanets;
  }
}
