// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:hotel_booking_app/features/account/presentation/pages/account_page.dart'
    as _i1;
import 'package:hotel_booking_app/features/account/presentation/pages/language_page.dart'
    as _i5;
import 'package:hotel_booking_app/features/favorites/presentation/pages/favorites_page.dart'
    as _i2;
import 'package:hotel_booking_app/features/home/presentation/pages/home_page.dart'
    as _i3;
import 'package:hotel_booking_app/features/hotels/presentation/pages/hotels_page.dart'
    as _i4;
import 'package:hotel_booking_app/features/overview/presentation/pages/overview_page.dart'
    as _i6;

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i7.PageRouteInfo<void> {
  const AccountRoute({List<_i7.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountPage();
    },
  );
}

/// generated route for
/// [_i2.FavoritesPage]
class FavoritesRoute extends _i7.PageRouteInfo<void> {
  const FavoritesRoute({List<_i7.PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.HotelsPage]
class HotelsRoute extends _i7.PageRouteInfo<void> {
  const HotelsRoute({List<_i7.PageRouteInfo>? children})
    : super(HotelsRoute.name, initialChildren: children);

  static const String name = 'HotelsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.HotelsPage();
    },
  );
}

/// generated route for
/// [_i5.LanguagePage]
class LanguageRoute extends _i7.PageRouteInfo<void> {
  const LanguageRoute({List<_i7.PageRouteInfo>? children})
    : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.LanguagePage();
    },
  );
}

/// generated route for
/// [_i6.OverviewPage]
class OverviewRoute extends _i7.PageRouteInfo<void> {
  const OverviewRoute({List<_i7.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.OverviewPage();
    },
  );
}
