import 'package:auto_route/auto_route.dart';

import '../../hotel_booking_app.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: homePath,
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(
          path: overviewPath,
          page: OverviewRoute.page,
          title: (context, _) => context.l10n.overview,
        ),
        AutoRoute(
          path: hotelsPath,
          page: HotelsRoute.page,
          title: (context, _) => context.l10n.hotels,
        ),
        AutoRoute(
          path: favoritesPath,
          page: FavoritesRoute.page,
          title: (context, _) => context.l10n.favorites,
        ),
        AutoRoute(
          path: accountPath,
          page: AccountTab.page,
          children: [
            AutoRoute(
              path: '',
              page: AccountRoute.page,
              initial: true,
              title: (context, _) => context.l10n.account,
            ),
            AutoRoute(
              path: languagePath,
              page: LanguageRoute.page,
              title: (context, _) => context.l10n.language,
            ),
          ],
        ),
      ],
    ),
  ];
}

/// Add empty route to account tab for routing account page and
/// language page at same route
// ignore: constant_identifier_names
const AccountTab = EmptyShellRoute(accountTab);
