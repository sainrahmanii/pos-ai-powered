import 'package:pos_ai_powered/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:pos_ai_powered/features/auth/data/models/auth_model.dart';
import 'package:pos_ai_powered/features/auth/domain/entities/auth.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  const AuthRepositoryImpl(this.remote);

  @override
  Future<Auth> login(String email, String password) async {
    final credential = await remote.login(email, password);
    return AuthModel.fromFirebase(credential.user!).toEntity();
  }

  @override
  Future<void> logout() {
    return remote.logout();
  }

  @override
  Stream<Auth?> authState() {
    return remote.authState().map(
      (user) => user == null ? null : AuthModel.fromFirebase(user).toEntity(),
    );
  }
}
