import 'package:auto_route/auto_route.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

@AutoRouterConfig()
class FakeAppRouter extends RootStackRouter implements AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(page: OverviewRoute.page),
        AutoRoute(page: HotelsRoute.page),
        AutoRoute(page: FavoritesRoute.page),
        AutoRoute(
          page: AccountTab.page,
          children: [
            AutoRoute(page: AccountRoute.page, initial: true),
            AutoRoute(page: LanguageRoute.page),
          ],
        ),
      ],
    ),
  ];
}

// ignore: constant_identifier_names
const AccountTab = EmptyShellRoute(accountTab);
