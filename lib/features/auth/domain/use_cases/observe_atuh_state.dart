import 'package:pos_ai_powered/features/auth/domain/entities/auth.dart';
import 'package:pos_ai_powered/features/auth/domain/repositories/auth_repository.dart';

class ObserveAtuhState {
  final AuthRepository repository;

  ObserveAtuhState(this.repository);

  Stream<Auth?> call() {
    return repository.authState();
  }
}
