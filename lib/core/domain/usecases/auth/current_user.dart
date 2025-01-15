import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';

class CurrentUser implements UseCase<UserModel, NoParams> {
  final AuthRepositoryImpl authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
