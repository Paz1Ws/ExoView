import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/config/entities/user.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/core/domain/repositories/auth_repository.dart';

class GetExoplanets implements UseCase<List<ExoplanetEntity>, NoParams> {
  final ExoplanetRepository exoplanetRepository;
  GetExoplanets(this.exoplanetRepository);

  @override
  Future<Either<Failure, List<ExoplanetEntity>>> call(NoParams params) async {
    return await exoplanetRepository.getExoplanets();
  }
}
