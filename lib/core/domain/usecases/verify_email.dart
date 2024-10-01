// import 'package:fpdart/src/either.dart';
// import 'package:myapp/config/failures/failures.dart';
// import 'package:myapp/config/usecase/usecase.dart';
// import 'package:myapp/core/domain/repositories/auth_repository.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class VerifyEmailUseCase implements Usecase<AuthResponse, VerifyEmailParams> {
//   final AuthRepository authRepository;
//   const VerifyEmailUseCase(this.authRepository);
//   @override
//   Future<Either<Failure, AuthResponse>> call(VerifyEmailParams params) {
//     return authRepository.verifyEmail(params.code, params.email);
//   }
// }

// class VerifyEmailParams {
//   final String code;
//   final String email;

//   VerifyEmailParams({required this.code, required this.email});
// }
