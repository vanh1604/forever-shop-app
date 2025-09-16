import 'package:first_project/theme/app_themes.dart';
import 'package:first_project/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        title: 'GoRouter ShellRoute Example',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
      ),
    ),
  );
}
