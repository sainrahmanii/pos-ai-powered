import 'package:pos_ai_powered/features/auth/domain/entities/auth.dart';
import 'package:pos_ai_powered/features/auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Auth> call({required String email, required String password}) {
    return repository.login(email, password);
  }
}
