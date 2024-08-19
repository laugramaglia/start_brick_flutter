import 'dart:ui';

class L10n {
  static final allSupported = supportedLocales.values.toList();

  static Map<String, Locale> get supportedLocales => {
        'english': const Locale('en'),
        'español': const Locale('es'),
      };
}
