import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routerpractice/layout/default_layout.dart';
import 'package:routerpractice/provider/auth_provider.dart';
import 'package:routerpractice/screen/3_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/one');
            },
            child: const Text('screen one go'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(ThreeeScreen.routeName);
              // context.go('/one/two/three');
            },
            child: const Text('screen three go'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/asd');
              // context.go('/one/two/three');
            },
            child: const Text('error'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login');
              // context.go('/one/two/three');
            },
            child: const Text('loginscreen'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(userProvider.notifier).logout();
            },
            child: const Text('log out'),
          ),
        ],
      ),
    );
  }
}
