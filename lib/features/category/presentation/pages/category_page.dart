
            import 'package:flutter/material.dart';

            class CategoryPage extends StatelessWidget {
                const CategoryPage({super.key});

                static const String routeName = '/category';

                @override
                Widget build(BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(
                            title: const Text('Category'),
                        ),
                        body: const Center(
                            child: Text('Category Page'),
                        ),
                    );
                }
            }