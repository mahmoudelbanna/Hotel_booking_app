import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = [
      OverviewRoute(),
      HotelsRoute(),
      FavoritesRoute(),
      AccountRoute(),
    ];
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => _appBarBuilder(
        context: context,
        tabsRouter: tabsRouter,
      ),
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavBar(
          onTap: tabsRouter.setActiveIndex,
          currentIndex: tabsRouter.activeIndex,
        );
      },
    );
  }
}

PreferredSizeWidget _appBarBuilder(
    {required BuildContext context, required TabsRouter tabsRouter}) {
  final titles = {
    0: context.l10n.overview,
    1: context.l10n.hotels,
    2: context.l10n.favorites,
    3: context.l10n.account,
  };

  final title = titles[tabsRouter.activeIndex] ?? context.l10n.overview;

  return AppBar(
    title: Text(title),
  );
}
