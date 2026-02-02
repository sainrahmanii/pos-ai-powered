import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_ai_powered/features/auth/presentation/widgets/button_primary.dart';
import 'package:pos_ai_powered/features/auth/presentation/widgets/icon_with_button.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const String routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    bool obsecureText = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  decoration: InputDecoration(
                    hintText: "Your email",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
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
                  decoration: InputDecoration(
                    hintText: "Your Password",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    suffixIcon: Icon(CupertinoIcons.eye_slash_fill),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                ),
                TextButton(
                  onPressed: () {},
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
                  onPressed: () {},
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 0,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SignUpPage()),
                        // );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: ColorConstant.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or With'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 24),
                IconWithButton(
                  textButton: "Sign in with Google",
                  assetIconButton: "assets/icons/google.png",
                ),
                SizedBox(height: 8),
                IconWithButton(
                  textButton: "Sign in with Apple",
                  assetIconButton: "assets/icons/apple.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
