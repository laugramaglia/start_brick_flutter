import 'package:flutter/material.dart';

class TileSectionWidget extends StatelessWidget {
  final String? title;
  final List<
      ({
        Widget? title,
        Widget? trailing,
        void Function()? onTap,
        Widget? leading,
        bool show,
      })> children;
  const TileSectionWidget({super.key, this.title, required this.children});

  @override
  Widget build(BuildContext context) => Material(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (title case final title?)
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant))),
              const SizedBox(height: 12),
              Material(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  child: Column(children: [
                    for (final item in children)
                      if (item.show)
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          leading: item.leading,
                          title: item.title,
                          trailing: item.trailing,
                          onTap: item.onTap,
                        )
                  ])),
            ],
          ),
        ),
      );
}
