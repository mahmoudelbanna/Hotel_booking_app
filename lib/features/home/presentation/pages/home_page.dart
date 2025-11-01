import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = [
      const OverviewRoute(),
      const HotelsRoute(),
      const FavoritesRoute(),
      AccountTab(),
    ];
    return AutoTabsScaffold(
      appBarBuilder:
          (_, tabsRouter) => AppBar(
            title: Text(context.topRoute.title(context)),
            leading: AutoLeadingButton(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
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
