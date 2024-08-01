import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/features/account/presentation/ui/pages/account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  final List<
      ({
        String label,
        IconData iconData,
        Widget page,
      })> items = [
    (
      label: 'Home',
      iconData: Icons.home_outlined,
      page: const SizedBox(),
    ),
    (
      iconData: Icons.person_outlined,
      label: 'Account',
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
          indicatorColor: Theme.of(context).colorScheme.primary,
          selectedIndex: currentPageIndex,
          destinations: List<NavigationDestination>.from(items.map(
            (item) => NavigationDestination(
              icon: Icon(item.iconData,
                  color: currentPageIndex == items.indexOf(item)
                      ? Theme.of(context).colorScheme.onPrimary
                      : null),
              label: item.label,
            ),
          )),
        ),
        body:
            List<Widget>.from(items.map((item) => item.page))[currentPageIndex],
      );
}
