import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/entitties/user.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/domain/repositories/auth_repository.dart';

class SignIn implements UseCase<UserEntity, SignInParams> {
  final AuthRepository authRepository;
  const SignIn(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
