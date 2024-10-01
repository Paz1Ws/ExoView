import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/entitties/user.dart';
import 'package:myapp/config/failures/failures.dart';

abstract interface class AuthRepository {
  // Future<void> signInWithGoogle();
  // Future<void> signInWithFacebook();
  // Future<void> signInWithApple();
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> currentUser();
  // Future<Either<Failure, AuthResponse>> verifyEmail(String code, String email);
  // Future<void> signOut();
  // Future<bool> isSignedIn();
  // Future<User> getUser();
}
