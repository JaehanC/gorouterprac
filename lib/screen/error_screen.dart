import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routerpractice/layout/default_layout.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () {
              context.go('/');
              // context.go('/one/two/three');
            },
            child: const Text('홈으로'),
          ),
        ],
      ),
    );
  }
}
