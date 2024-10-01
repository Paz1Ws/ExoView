import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:myapp/config/network/connection_checker.dart';
import 'package:myapp/config/secrets/app_secrets.dart';
import 'package:myapp/core/data/datasources/auth_remote_data_source.dart';
import 'package:myapp/core/data/repositories/auth_repository_impl.dart';
import 'package:myapp/core/domain/usecases/verify_email.dart';
import 'package:myapp/init_dependencies.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/core/domain/usecases/sign_up.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return SupabaseClient(AppSecrets.supabaseUrl, AppSecrets.supabaseKey);
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthRemoteDataSourceImpl(client);
});

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return serviceLocator<AuthRepositoryImpl>();
});

final signUpUseCaseProvider = Provider<SignUp>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignUp(authRepository);
});

// TEXTFORMFIELDS
final emailControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final passwordControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final nameControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
