import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

const homePath = '/';
const overviewPath = 'overview';
const hotelsPath = 'hotels';
const favoritesPath = 'favorites';
const accountPath = 'account';
const languagePath = 'language';

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
            ),
            AutoRoute(
              path: hotelsPath,
              page: HotelsRoute.page,
            ),
            AutoRoute(
              page: FavoritesRoute.page,
            ),
            AutoRoute(
              page: AccountRouteNavigation.page,
              children: [
                AutoRoute(
                  path: accountPath,
                  page: AccountRoute.page,
                  initial: true,
                ),
                AutoRoute(
                  path: languagePath,
                  page: LanguageRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
