import 'package:firebase_auth/firebase_auth.dart';
import 'package:pos_ai_powered/features/auth/domain/entities/auth.dart';

class AuthModel {
  final String id;
  final String? email;

  AuthModel({required this.id, this.email});

  // fetch user from firebase
  factory AuthModel.fromFirebase(User user) {
    return AuthModel(id: user.uid, email: user.email);
  }

  Auth toEntity() {
    return Auth(id: id, email: email);
  }
}
