import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/features/account/presentation/ui/pages/account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 1;

  List<
      ({
        GlobalObjectKey key,
        String label,
        IconData iconData,
        Widget page,
      })> items(BuildContext context) => [
        (
          key: const GlobalObjectKey('home'),
          label: 'home',
          iconData: Icons.home_outlined,
          page: const SizedBox(),
        ),
        (
          key: const GlobalObjectKey('account'),
          iconData: Icons.person_outlined,
          label: context.localizations.account.capitalize(),
          page: const AccountPage(),
        ),
      ];

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: context.colorScheme.primary,
          selectedIndex: currentPageIndex,
          destinations: List<NavigationDestination>.from(items(context).map(
            (item) => NavigationDestination(
              key: item.key,
              icon: Icon(item.iconData,
                  color: currentPageIndex == items(context).indexOf(item)
                      ? context.colorScheme.onPrimary
                      : null),
              label: item.label,
            ),
          )),
        ),
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Material(
              key: ValueKey(currentPageIndex),
              child: List<Widget>.from(
                  items(context).map((item) => item.page))[currentPageIndex],
            )),
      );
}
