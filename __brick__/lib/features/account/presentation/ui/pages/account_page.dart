import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/features/theme/presentation/ui/widget/theme_settings_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text('Account',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const ThemeSettingsWidget(),
            ])),
          ],
        ),
      );
}
