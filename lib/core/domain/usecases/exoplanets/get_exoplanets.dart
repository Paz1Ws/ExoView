import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';

class GetExoplanets implements UseCase<List<Exoplanet>, NoParams> {
  final ExoplanetRepositoryImpl exoplanetRepository;
  GetExoplanets(this.exoplanetRepository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    return await exoplanetRepository.getExoplanets();
  }
}
