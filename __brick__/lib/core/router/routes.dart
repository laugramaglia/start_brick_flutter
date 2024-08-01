import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/core/theme/presentation/ui/pages/home_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
