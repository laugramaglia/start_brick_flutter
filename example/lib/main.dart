import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example/core/config/local_db/hive_config.dart';
import 'package:example/core/theme/presentation/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.instance.init();
  runApp(const ProviderScope(child: App()));
}
