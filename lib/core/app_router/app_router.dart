import 'package:auto_route/auto_route.dart';
import '../../hotel_booking_app.dart';

const homePath = '/';
const overviewPath = 'overview';
const hotelsPath = 'hotels';
const favoritesPath = 'favorites';
const accountPath = 'account';
const languagePath = 'language';
const accountTab = 'accountTab';

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
              page: OverviewRoute.page,
              title: (context, _) => context.l10n.overview,
            ),
            AutoRoute(
              page: HotelsRoute.page,
              title: (context, _) => context.l10n.hotels,
            ),
            AutoRoute(
              page: FavoritesRoute.page,
              title: (context, _) => context.l10n.favorites,
            ),
            AutoRoute(
              page: AccountTab.page,
              children: [
                AutoRoute(
                  path: accountPath,
                  page: AccountRoute.page,
                  initial: true,
                  title: (context, _) => context.l10n.account,
                ),
                AutoRoute(
                  path: languagePath,
                  page: LanguageRoute.page,
                  title: (context, _) => context.l10n.language,
                )
              ],
            ),
          ],
        ),
      ];
}

// ignore: constant_identifier_names
const AccountTab = EmptyShellRoute(accountTab);
