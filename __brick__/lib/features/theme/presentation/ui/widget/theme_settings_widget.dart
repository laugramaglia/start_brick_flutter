import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/presentation/providers/color_theme_provider.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/presentation/providers/theme_selector_provider.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/presentation/ui/widgets/tile_section_widget.dart';

class ThemeSettingsWidget extends ConsumerWidget {
  const ThemeSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      TileSectionWidget(title: 'Settings', children: [
        (
          show: true,
          leading: const Icon(Icons.color_lens),
          title: const Text('Color Seed'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            Color? color = await showDialog<Color>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Select Color Theme'),
                content: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    for (Color color in [
                      Colors.amber,
                      Colors.blue,
                      Colors.red,
                      Colors.deepPurple
                    ])
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () => Navigator.of(context).pop(color),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: color, shape: BoxShape.circle),
                          child: const SizedBox.square(dimension: 45),
                        ),
                      ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'))
                ],
              ),
            );

            if (color != null) {
              ref.read(colorThemeProvider.notifier).setColor(color);
            }
          },
        ),
        (
          show: true,
          leading: const Icon(Icons.brightness_medium_outlined),
          title: const Text('Color Brightness'),
          trailing: Text(ref.watch(themeSelectorProvider).name,
              style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            ref.read(themeSelectorProvider.notifier).setThemeMode();
          },
        )
      ]);
}
