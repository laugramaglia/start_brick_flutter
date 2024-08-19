import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example/core/router/router_provider.dart';
import 'package:example/core/theme/presentation/providers/color_theme_provider.dart';
import 'package:example/core/theme/presentation/providers/language_provider.dart';
import 'package:example/core/theme/presentation/providers/theme_selector_provider.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// The Widget that configures your application.
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'App name',
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.allSupported,
      locale: ref.watch(languageProvider),
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
