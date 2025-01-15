import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/entities/user.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> currentUser();
  Future<Either<Failure, UserModel>> signInWithGoogle();
  Future<void> signOut();
}
