import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserCredential> login(String email, String password);
  Future<void> logout();
  Stream<User?> authState();
}
