import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_ai_powered/features/auth/presentation/pages/sign_in.dart';
import 'package:pos_ai_powered/main_screen.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 🔥 LOGIN
        if (snapshot.hasData) {
          return MainScreen(
            key: ValueKey(snapshot.data!.uid), // ⬅️ DI SINI
          );
        }

        // 🔥 LOGOUT
        return const SignIn(
          key: ValueKey('sign_in'), // ⬅️ DI SINI
        );
      },
    );
  }
}
