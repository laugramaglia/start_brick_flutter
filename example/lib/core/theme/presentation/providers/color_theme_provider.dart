import 'package:flutter/material.dart';
import 'package:example/core/theme/theme_hive/color_theme_box.dart';
import 'package:example/core/utils/extensions/int_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_theme_provider.g.dart';

@riverpod
class ColorTheme extends _$ColorTheme {
  @override
  Color build() {
    if (ColorThemeBox.instance.box.values.isEmpty) {
      return Colors.lightBlueAccent;
    }
    ref.keepAlive();
    return ColorThemeBox.instance.box.values.first.toColor();
  }

  Future<void> setColor(Color color) async {
    await ColorThemeBox.instance.box.put(0, color.value);
    state = ColorThemeBox.instance.box.values.first.toColor();
  }

  Future<void> removeColor() async {
    await ColorThemeBox.instance.box.deleteAt(0);
    state = Colors.lightBlueAccent;
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
