import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '../../hotel_booking_app.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override

  /// Build a [MaterialApp] with the language and theme set based on the state of
  /// the [LanguageCubit].
  ///
  /// This widget listens to the [LanguageCubit] and rebuilds the [MaterialApp]
  /// with the new language and theme when the language code changes.
  ///
  /// The [localeResolutionCallback] is used to determine the locale of the
  /// [MaterialApp] based on the device locale and the supported locales.
  /// If the [LanguageCubit] has a language code and a country code, the
  /// [MaterialApp] is given the locale with that language code and country code.
  /// Otherwise, the [MaterialApp] is given null for its locale.
  ///
  /// The theme is determined by the [_themeData] function.
  ///
  /// The [MaterialApp] is given the [appRouter] as its router.
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      buildWhen: (previous, current) =>
          previous.languageCode != current.languageCode,
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Hotel Booking App',
          theme: _themeData(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: (deviceLocale, supportedLocales) =>
              resolveLocale(
            context: context,
            state: state,
            deviceLocale: deviceLocale,
            supportedLocales: supportedLocales,
          ),
          locale: state.languageCode != null && state.countryCode != null
              ? Locale(state.languageCode!, state.countryCode!)
              : null,
          routerConfig: appRouter.config(),
        );
      },
    );
  }

  /// Creates a [ThemeData] object for the app.
  ///
  /// The created [ThemeData] object has a blue app bar background and a white,
  /// 20-point, bold font for the app bar title. The seed color for the color
  /// scheme is deep purple. Material 3 is used.
  ///
  /// Returns the created [ThemeData] object.
  ThemeData _themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}
