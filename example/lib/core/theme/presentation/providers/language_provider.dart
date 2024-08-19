import 'dart:ui';

import 'package:example/core/config/local_db/hive_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';

@riverpod
class Language extends _$Language {
  @override
  Locale? build() => HiveConfig.instance.languageBox.language;

  Future<void> setLocale(Locale locale) async {
    await HiveConfig.instance.languageBox.setLanguage(locale);
    state = locale;
  }
}
