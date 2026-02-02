import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_ai_powered/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:pos_ai_powered/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pos_ai_powered/features/auth/domain/use_cases/login.dart';
import 'package:pos_ai_powered/features/auth/presentation/widgets/button_primary.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obsecureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Login loginUseCase = Login(
    AuthRepositoryImpl(AuthRemoteDataSourceImpl(FirebaseAuth.instance)),
  );

  Future<void> _login() async {
    try {
      final user = await loginUseCase(
        email: emailController.text,
        password: passwordController.text,
      );

      debugPrint('Login Success: ${user.id}');
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back 👋",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "Sign to your account",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(height: 6),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Your email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(height: 6),
              TextFormField(
                obscureText: obsecureText,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Your Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                    icon: Icon(
                      obsecureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
              TextButton(
                onPressed: _login,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: ColorConstant.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ButtonPrimary(
                textButton: "Login",
                btnColor: ColorConstant.primary,
                textBtnColor: Colors.white,
                cornerRadiusButton: BorderRadiusGeometry.circular(48),
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
