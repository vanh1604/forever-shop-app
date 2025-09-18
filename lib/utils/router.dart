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
import 'package:shared_preferences/shared_preferences.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final pref = SharedPreferences.getInstance();
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterPrefix.welcome,
  redirect: (BuildContext context, GoRouterState state) async {
    final prefs = await SharedPreferences.getInstance();
    final bool loggedIn = prefs.getString('authToken') != null;
    final String location = state.matchedLocation;
    final bool isPublicPage =
        location == RouterPrefix.welcome ||
        location == RouterPrefix.signIn ||
        location == RouterPrefix.signUp;
    if (!loggedIn && !isPublicPage) {
      return RouterPrefix.signIn;
    }
    if (loggedIn && isPublicPage) {
      return RouterPrefix.homePage;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: RouterPrefix.welcome,
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: RouterPrefix.signIn,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: RouterPrefix.signUp,
      builder: (context, state) => SignUpScreen(),
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
