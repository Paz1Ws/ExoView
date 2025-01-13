import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/entities/user.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';

class SignIn implements UseCase<UserEntity, SignInParams> {
  final AuthRepositoryImpl authRepository;
  const SignIn(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInWithGoogle implements UseCase<UserEntity, NoParams> {
  final AuthRepositoryImpl authRepository;
  const SignInWithGoogle(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepository.signInWithGoogle();
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
