import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(page: OverviewRoute.page),
            AutoRoute(page: HotelsRoute.page),
            AutoRoute(page: FavoritesRoute.page),
            AutoRoute(page: AccountRoute.page),
          ],
        ),
      ];
}
