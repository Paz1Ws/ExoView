import 'package:myapp/config/failures/exceptions.dart';
import 'package:myapp/core/data/models/user_model.dart';
import 'package:myapp/presentation/screens/auth/providers/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:myapp/config/secrets/app_secrets.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrentUserData();
  Future<UserModel> signInWithGoogle();
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerException('User is null!');
      }
      // Store the session
      await supabaseClient.auth.setSession(response.session!.refreshToken!);
      // Save the session to local storage
      final userMetadata = response.user!.userMetadata ?? {};
      UserModel userModel = UserModel.fromJson(response.user!.toJson());
      userModel.name = userMetadata['name'] ?? '';
      return userModel;
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw ServerException('User is null!');
      }
      // Store the session
      await supabaseClient.auth.setSession(response.session!.refreshToken!);
      // Save the session to local storage
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      final session = supabaseClient.auth.currentSession;
      if (session != null) {
        final userData = await supabaseClient
            .from('users')
            .select()
            .eq('id', session.user.id)
            .single();
        return UserModel.fromJson(userData).copyWith(
          email: session.user.email,
        );
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
          clientId:
              '562764885619-1n1nosmheu9rqm31cdu5s26aq1oiof04.apps.googleusercontent.com',
          serverClientId:
              '562764885619-nneikp4qti7ogdlbkpblclfrrijstmjb.apps.googleusercontent.com');

      final googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final idToken = googleAuth.idToken!;
      final accessToken = googleAuth.accessToken;
      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      if (response.user == null) {
        throw ServerException('User is null!');
      }
      // Store the session
      await supabaseClient.auth.setSession(response.session!.refreshToken!);
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
    } catch (e) {
      await supabaseClient.auth.signOut();
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('refreshToken');
  }
}
