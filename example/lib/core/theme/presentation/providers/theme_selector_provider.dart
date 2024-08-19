import 'package:flutter/material.dart';
import 'package:example/core/theme/theme_hive/theme_mode_box.dart';
import 'package:example/core/utils/extensions/string_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_selector_provider.g.dart';

@riverpod
class ThemeSelector extends _$ThemeSelector {
  @override
  ThemeMode build() {
    if (ThemeModeBox.instance.box.values.isEmpty) {
      return ThemeMode.system;
    }
    ref.keepAlive();
    return ThemeModeBox.instance.box.values.first.toThemeMode();
  }

  Future<void> setThemeMode([ThemeMode? themeMode]) async {
    if (themeMode == null) {
      if (state == ThemeMode.system) {
        await ThemeModeBox.instance.box.put(0, ThemeMode.dark.name);
      } else if (state == ThemeMode.dark) {
        await ThemeModeBox.instance.box.put(0, ThemeMode.light.name);
      } else {
        await ThemeModeBox.instance.box.put(0, ThemeMode.system.name);
      }
    } else {
      await ThemeModeBox.instance.box.put(0, themeMode.name);
    }
    state = ThemeModeBox.instance.box.values.first.toThemeMode();
  }

  Future<void> removeThemeMode() async {
    await ThemeModeBox.instance.box.deleteAt(0);
    state = ThemeMode.system;
  }

  // Future<void> clear() async {
  //   await _box.clear();
  // }

  // Future<void> delete(String key) async {
  //   await _box.delete(key);
  // }

  // Future<int> add(Color value) async {
  //   return await _box.add(ColorSeed.fromColor(value));
  // }
}
