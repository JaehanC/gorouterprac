import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routerpractice/layout/default_layout.dart';
import 'package:routerpractice/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(userProvider.notifier).login(name: 'codefactory');
              // context.go('/one/two/three');
            },
            child: const Text('login'),
          ),
        ],
      ),
    );
  }
}
