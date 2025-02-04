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

PreferredSizeWidget _appBarBuilder({
  required BuildContext context,
  required TabsRouter tabsRouter,
}) {
  final routeTitles = {
    OverviewRoute.name: context.l10n.overview,
    HotelsRoute.name: context.l10n.hotels,
    FavoritesRoute.name: context.l10n.favorites,
    AccountRoute.name: context.l10n.account,
    LanguageRoute.name: context.l10n.language,
  };

  final String title =
      routeTitles[context.topRoute.name] ?? context.l10n.overview;

  return AppBar(
    title: Text(title),
    leading: AutoLeadingButton(
      ignorePagelessRoutes: true,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
  );
}
