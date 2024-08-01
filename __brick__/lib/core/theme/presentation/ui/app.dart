import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name.snakeCase()}}/core/router/router_provider.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/presentation/providers/color_theme_provider.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/presentation/providers/theme_selector_provider.dart';

/// The Widget that configures your application.
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Home Flow',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ref.watch(colorThemeProvider)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ref.watch(colorThemeProvider),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ref.watch(themeSelectorProvider),
      routerConfig: router,
    );
  }
}
