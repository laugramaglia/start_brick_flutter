import 'dart:ui';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:{{project_name.snakeCase()}}/core/config/local_db/const_type_id.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/hive_adapters.dart/locale_adapter.dart';

class LanguageBox {
  // crerate singelton instance
  static final LanguageBox instance = LanguageBox._();
  LanguageBox._();

  late final Box<Locale> box;

  final String hiveBoxName = 'language_box';
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(kLocaleTypeId)) {
      Hive.registerAdapter(LocaleAdapter());
    }
    if (!Hive.isBoxOpen(hiveBoxName)) {
      box = await Hive.openBox<Locale>(hiveBoxName);
    }
  }

  Future<void> clear() async => await box.clear();

  Locale? get language => box.get('language');

  Future<void> setLanguage(Locale language) async =>
      await box.put('language', language);
}
