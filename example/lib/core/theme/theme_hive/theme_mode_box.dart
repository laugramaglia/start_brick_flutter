import 'package:hive_flutter/hive_flutter.dart';

class ThemeModeBox {
  // crerate singelton instance
  static final ThemeModeBox instance = ThemeModeBox._();
  ThemeModeBox._();

  late final Box<String> box;

  final String _hiveBoxName = 'theme_mode_box';
  Future<void> init() async {
    if (!Hive.isBoxOpen(_hiveBoxName)) {
      box = await Hive.openBox<String>(_hiveBoxName);
    }
  }

  Future<void> clear() async => await box.clear();
}
