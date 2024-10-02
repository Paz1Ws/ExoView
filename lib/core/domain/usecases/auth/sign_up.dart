import 'package:fpdart/src/either.dart';
import 'package:myapp/config/entities/user.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';

class SignUp implements UseCase<UserEntity, SignUpParams> {
  final AuthRepositoryImpl authRepository;
  const SignUp(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String name;

  SignUpParams(
      {required this.email, required this.password, required this.name});
}
