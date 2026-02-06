import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: Text('Profile Page')));
  }
}
