import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example/core/theme/presentation/providers/color_theme_provider.dart';
import 'package:example/core/theme/presentation/providers/language_provider.dart';
import 'package:example/core/theme/presentation/providers/theme_selector_provider.dart';
import 'package:example/core/theme/presentation/ui/widgets/tile_section_widget.dart';
import 'package:example/core/utils/extensions/context_extension.dart';
import 'package:example/core/utils/extensions/string_extension.dart';
import 'package:example/l10n/l10n.dart';

class ThemeSettingsWidget extends ConsumerWidget {
  const ThemeSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      TileSectionWidget(title: context.localizations.settings, children: [
        (
          show: true,
          leading: const Icon(Icons.color_lens),
          title: Text(context.localizations.color_seed.capitalize()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            Color? color = await showDialog<Color>(
              context: context,
              builder: (context) => AlertDialog(
                title:
                    Text(context.localizations.select_color_theme.capitalize()),
                content: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    for (Color color in [
                      Colors.amber,
                      Colors.lightBlueAccent,
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
                      child: Text(context.localizations.cancel.capitalize())),
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
          title: Text(context.localizations.color_brightness.capitalize()),
          trailing: Text(ref.watch(themeSelectorProvider).name,
              style: context.textTheme.bodyMedium),
          onTap: () {
            ref.read(themeSelectorProvider.notifier).setThemeMode();
          },
        ),
        (
          show: true,
          leading: const Icon(Icons.language_rounded),
          title: Text(context.localizations.languague.capitalize()),
          trailing: Text(context.localizations.languague_current.capitalize(),
              style: context.textTheme.bodyMedium),
          onTap: () async {
            Locale? locale = await showDialog<Locale>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(context.localizations.select_language.capitalize()),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.from(
                    L10n.supportedLocales.entries.map(
                      (entry) => ListTile(
                        title: Text(entry.key.capitalize()),
                        onTap: () => Navigator.of(context).pop(entry.value),
                      ),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(context.localizations.cancel.capitalize())),
                ],
              ),
            );

            if (locale != null) {
              ref.read(languageProvider.notifier).setLocale(locale);
            }
          },
        )
      ]);
}
