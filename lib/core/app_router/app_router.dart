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
            CustomRoute(
              page: OverviewRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            
            CustomRoute(
              page: HotelsRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            CustomRoute(
              page: FavoritesRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 500,
            ),
            AutoRoute(
              page: AccountRouteNavigation.page,
              children: [
                CustomRoute(
                  path: accountPath,
                  page: AccountRoute.page,
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 500,
                ),
                CustomRoute(
                  path: languagePath,
                  page: LanguageRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 500,
                ),
              ],
            ),
          ],
        ),
      ];
}
