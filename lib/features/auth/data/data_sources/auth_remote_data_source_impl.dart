import 'package:firebase_auth/firebase_auth.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  const AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> login(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return firebaseAuth.signOut();
  }

  @override
  Stream<User?> authState() {
    return firebaseAuth.authStateChanges();
  }
}
