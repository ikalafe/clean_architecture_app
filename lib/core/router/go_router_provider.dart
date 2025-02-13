import 'package:clean_project/core/router/route_name.dart';
import 'package:clean_project/features/login/presentation/ui/login_screen.dart';
import 'package:clean_project/features/signup/presentation/ui/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          name: loginRoute,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          name: signUpRoute,
          builder: (context, state) => SignUpScreen(),
        ),
      ],
    );
  },
);
