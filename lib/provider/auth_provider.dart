import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routerpractice/model/user_model.dart';
import 'package:routerpractice/screen/login_screen.dart';

import '../screen/1_screen.dart';
import '../screen/2_screen.dart';
import '../screen/3_screen.dart';
import '../screen/error_screen.dart';
import '../screen/home_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authStateProvider = AuthNotifier(ref: ref);
    return GoRouter(
      redirect: (context, state) => authStateProvider._redirectLogic(state),
      refreshListenable: authStateProvider,
      //홈화면
      initialLocation: '/login',
      errorBuilder: (context, state) {
        return ErrorScreen(error: state.error.toString());
      },
      //redirect
      //refresh
      routes: authStateProvider._routes,
    );
  },
);

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({required this.ref}) {
    ref.listen<UserModel?>(
      userProvider,
      (previous, next) {
        if (previous != next) {
          notifyListeners();
        }
      },
    );
  }

  String? _redirectLogic(GoRouterState state) {
    //usermodel의 인스턴스 또는 null
    final user = ref.read(userProvider);

    final loginIn = state.location == '/login';
//유저 정보가 없다 - 로그인한 상태가 아니다.
//유저정보가 없고 로그인하려는 중이 아니라면 로그인 페이지로 이동한다
    if (user == null) {
      return loginIn ? null : '/login';
    }
//유저정보가 있는데 로그인 페이지라면 홈으로 이동
//위의 이프문을 통과하면 유저정보는 무조건 있는거임
    if (loginIn) {
      return '/';
    }
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'one',
              builder: (context, state) => const OneScreen(),
              routes: [
                GoRoute(
                  path: 'two',
                  builder: (context, state) => const TwoScreen(),
                  routes: [
                    GoRoute(
                      name: 'three',
                      path: ThreeeScreen.routeName,
                      builder: (context, state) => const ThreeeScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
      ];
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>(
    (ref) => UserStateNotifier());

//로그인한 상태면 usermodel인스턴스 상태로 넣어주기
//로그아웃 상태면 널상태로 넣어주기
class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  login({required String name}) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
