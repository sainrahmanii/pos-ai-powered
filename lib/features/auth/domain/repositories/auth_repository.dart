import 'package:pos_ai_powered/features/auth/domain/entities/auth.dart';

abstract interface class AuthRepository {
  Future<Auth> login(String email, String password);
  Future<void> logout();
  Stream<Auth?> authState();
}
