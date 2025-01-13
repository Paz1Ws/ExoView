import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/entities/user.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/repositories/auth_repository.dart';

class CurrentUser implements UseCase<UserEntity, NoParams> {
  final AuthRepositoryImpl authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
