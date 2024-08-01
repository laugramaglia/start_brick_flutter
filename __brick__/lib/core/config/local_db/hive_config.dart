import 'package:hive_flutter/hive_flutter.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/theme_hive/color_theme_box.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/theme_hive/theme_mode_box.dart';

class HiveConfig {
  HiveConfig._();
  static final HiveConfig instance = HiveConfig._();

  // // posts
  // final LocalPostsBox postBox = LocalPostsBox.instance;

  ColorThemeBox colorThemeBox = ColorThemeBox.instance;
  ThemeModeBox themeModeBox = ThemeModeBox.instance;

  Future<void> init() async {
    await Hive.initFlutter();
    await _start();
  }

  Future<void> _start() async {
    await Future.wait([
      // Theme
      colorThemeBox.init(),
      themeModeBox.init(),
    ]);
  }

  Future<void> clear() async {
    await Future.wait([
      // Theme
      colorThemeBox.clear(),
      themeModeBox.clear(),
    ]);
  }
}
