import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name.snakeCase()}}/core/config/local_db/hive_config.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/presentation/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.instance.init();
  runApp(const ProviderScope(child: App()));
}
