import 'package:first_project/layout_scaffold.dart';
import 'package:first_project/screens/productList_screen.dart';
import 'package:first_project/screens/product_detail.dart';
import 'package:first_project/screens/sign_in.dart';
import 'package:first_project/screens/sign_up.dart';
import 'package:first_project/screens/welcome.dart';
import 'package:first_project/theme/constants/router_prefix.dart';
import 'package:flutter/material.dart';
import 'package:first_project/screens/home.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterPrefix.welcome,
  routes: [
    GoRoute(
      path: RouterPrefix.welcome,
      builder: (context, state) => WelcomeScreen(), // Màn hình Welcome
    ),
    GoRoute(
      path: RouterPrefix.signIn,
      builder: (context, state) => SignInScreen(), // Màn hình Login
    ),
    GoRoute(
      path: RouterPrefix.signUp,
      builder: (context, state) => SignUpScreen(), // Màn hình Signup
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          LayoutScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterPrefix.homePage,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterPrefix.productList,
              builder: (context, state) => ProductlistScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final String id = state.pathParameters['id']!;
                    return ProductDetailScreen(id: id);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
