import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:myapp/core/domain/usecases/auth/current_user.dart';
import 'package:myapp/init_dependencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_providers.g.dart';

// LOGIC PROVIDERS
@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return SupabaseClient(AppSecrets.supabaseUrl, AppSecrets.supabaseKey);
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthRemoteDataSourceImpl(client);
}

@riverpod
AuthRepositoryImpl authRepository(AuthRepositoryRef ref) {
  return serviceLocator<AuthRepositoryImpl>();
}

@riverpod
SignUp signUpUseCase(SignUpUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignUp(authRepository);
}

@riverpod
SignIn signInUseCase(SignInUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignIn(authRepository);
}

@riverpod
SignInWithGoogle signInWithGoogle(ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInWithGoogle(authRepository);
}

@riverpod
Future<Either<Failure, UserModel>> getCurrentUser(GetCurrentUserRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return CurrentUser(authRepository).call(NoParams());
}

// TEXT CONTROLLERS
@riverpod
TextEditingController nameController(NameControllerRef ref) {
  return TextEditingController();
}

@riverpod
TextEditingController passwordController(PasswordControllerRef ref) {
  return TextEditingController();
}

@riverpod
TextEditingController emailController(EmailControllerRef ref) {
  return TextEditingController();
}

@riverpod
TextEditingController verifyPasswordController(
    VerifyPasswordControllerRef ref) {
  return TextEditingController();
}
