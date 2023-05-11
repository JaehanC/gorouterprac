import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routerpractice/layout/default_layout.dart';

class OneScreen extends StatelessWidget {
  const OneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop();
              // context.go('/one/two/three');
            },
            child: const Text('pop'),
          ),
        ],
      ),
    );
  }
}
