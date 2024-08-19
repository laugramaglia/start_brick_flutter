import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  // Snackbars
  successSnackBar([String? message]) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        backgroundColor: colorScheme.primary,
        content: Text(message ?? 'Success',
            style: Theme.of(this)
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorScheme.onPrimary)),
      ));
  errorSnackBar(String message) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        backgroundColor: colorScheme.error,
        content: Text(message,
            style: Theme.of(this)
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorScheme.onError)),
      ));

  // localization
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
