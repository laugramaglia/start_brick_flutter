import 'package:hive_flutter/hive_flutter.dart';

class ColorThemeBox {
  // crerate singelton instance
  static final ColorThemeBox instance = ColorThemeBox._();
  ColorThemeBox._();

  late final Box<int> box;

  final String hiveBoxName = 'color_theme_box';
  Future<void> init() async {
    if (!Hive.isBoxOpen(hiveBoxName)) {
      box = await Hive.openBox<int>(hiveBoxName);
    }
  }

  Future<void> clear() async => await box.clear();
}
