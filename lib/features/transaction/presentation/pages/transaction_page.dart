
            import 'package:flutter/material.dart';

            class TransactionPage extends StatelessWidget {
                const TransactionPage({super.key});

                static const String routeName = '/transaction';

                @override
                Widget build(BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(
                            title: const Text('Transaction'),
                        ),
                        body: const Center(
                            child: Text('Transaction Page'),
                        ),
                    );
                }
            }