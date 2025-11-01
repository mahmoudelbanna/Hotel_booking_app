import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../hotel_booking_app.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      buildWhen:
          (previous, current) => previous.languageCode != current.languageCode,
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Hotel Booking App',
          theme: _themeData(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback:
              (deviceLocale, supportedLocales) => resolveLocale(
                context: context,
                state: state,
                deviceLocale: deviceLocale,
                supportedLocales: supportedLocales,
              ),
          locale:
              state.languageCode != null && state.countryCode != null
                  ? Locale(state.languageCode!, state.countryCode!)
                  : null,
          routerConfig: appRouter.config(
            deepLinkBuilder: (deepLink) {
              if (deepLink.isValid) {
                return deepLink;
              } else {
                return DeepLink.defaultPath;
              }
            },
          ),
        );
      },
    );
  }

  ThemeData _themeData() {
    return ThemeData().copyWith(
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
