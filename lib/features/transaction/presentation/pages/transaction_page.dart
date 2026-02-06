import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  static const String routeName = '/transaction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: Text('Transaction Page')));
  }
}
