// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseClientHash() => r'85245b549db24fbc6e4c4ee03df5353a17b778b8';

/// See also [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient>;
String _$authRemoteDataSourceHash() =>
    r'af32bb7d06a7928c6f47bb5e014427688eaf41a8';

/// See also [authRemoteDataSource].
@ProviderFor(authRemoteDataSource)
final authRemoteDataSourceProvider =
    AutoDisposeProvider<AuthRemoteDataSource>.internal(
  authRemoteDataSource,
  name: r'authRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRemoteDataSourceRef = AutoDisposeProviderRef<AuthRemoteDataSource>;
String _$authRepositoryHash() => r'c79107179886b7f2df9b135529660f813a04dc62';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepositoryImpl>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepositoryImpl>;
String _$signUpUseCaseHash() => r'f5e7b57fb4f7ba60d56bbe37550b509e63ed499c';

/// See also [signUpUseCase].
@ProviderFor(signUpUseCase)
final signUpUseCaseProvider = AutoDisposeProvider<SignUp>.internal(
  signUpUseCase,
  name: r'signUpUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignUpUseCaseRef = AutoDisposeProviderRef<SignUp>;
String _$signInUseCaseHash() => r'3153cfda332750f1cf4da03d05c43a7b0e7fef66';

/// See also [signInUseCase].
@ProviderFor(signInUseCase)
final signInUseCaseProvider = AutoDisposeProvider<SignIn>.internal(
  signInUseCase,
  name: r'signInUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInUseCaseRef = AutoDisposeProviderRef<SignIn>;
String _$signInWithGoogleHash() => r'efd8ba737353464adb2c6bb10492f3f182f113c4';

/// See also [signInWithGoogle].
@ProviderFor(signInWithGoogle)
final signInWithGoogleProvider = AutoDisposeProvider<SignInWithGoogle>.internal(
  signInWithGoogle,
  name: r'signInWithGoogleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInWithGoogleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInWithGoogleRef = AutoDisposeProviderRef<SignInWithGoogle>;
String _$getCurrentUserHash() => r'52ab1ff1580719603f7120a55a52c641047d4fcf';

/// See also [getCurrentUser].
@ProviderFor(getCurrentUser)
final getCurrentUserProvider =
    AutoDisposeFutureProvider<Either<Failure, UserEntity>>.internal(
  getCurrentUser,
  name: r'getCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCurrentUserRef
    = AutoDisposeFutureProviderRef<Either<Failure, UserEntity>>;
String _$nameControllerHash() => r'239267bb64e385c6451f45ae34b3eca42a216a1a';

/// See also [nameController].
@ProviderFor(nameController)
final nameControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  nameController,
  name: r'nameControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nameControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NameControllerRef = AutoDisposeProviderRef<TextEditingController>;
String _$passwordControllerHash() =>
    r'364a9442d5458a20b9f411ac768ccb11842dcde7';

/// See also [passwordController].
@ProviderFor(passwordController)
final passwordControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  passwordController,
  name: r'passwordControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PasswordControllerRef = AutoDisposeProviderRef<TextEditingController>;
String _$emailControllerHash() => r'10881b7951cf7619961309a598d9e02dff5a658f';

/// See also [emailController].
@ProviderFor(emailController)
final emailControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  emailController,
  name: r'emailControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EmailControllerRef = AutoDisposeProviderRef<TextEditingController>;
String _$verifyPasswordControllerHash() =>
    r'f084ba38e6db07cd4a8645aad89cbce5efae627a';

/// See also [verifyPasswordController].
@ProviderFor(verifyPasswordController)
final verifyPasswordControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  verifyPasswordController,
  name: r'verifyPasswordControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$verifyPasswordControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VerifyPasswordControllerRef
    = AutoDisposeProviderRef<TextEditingController>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
