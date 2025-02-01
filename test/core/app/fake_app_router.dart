import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

class FakeAppRouter extends RootStackRouter implements AppRouter {
  FakeAppRouter() : super(navigatorKey: GlobalKey<NavigatorState>());

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
