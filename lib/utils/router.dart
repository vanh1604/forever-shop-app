import 'package:first_project/layout_scaffold.dart';
import 'package:first_project/screens/productList_screen.dart';
import 'package:first_project/theme/constants/router_prefix.dart';
import 'package:flutter/material.dart';
import 'package:first_project/screens/home.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterPrefix.homePage,
  routes: [
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
            ),
          ],
        ),
      ],
    ),
  ],
);
