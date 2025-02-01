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
              _localeResolutionCallback(
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

/// Resolves the app's locale based on the device's locale and the app's supported locales.
///
/// This function attempts to find a match between the device's locale and the app's supported
/// locales. If a matching locale is found, it is returned. If no match is found and the 
/// `languageCode` in the [state] is `null`, the language is set to the default locale using 
/// the [LanguageCubit]. The default locale is the last one in the list of supported locales.
///
/// - Parameters:
///   - deviceLocale: The locale of the device, which might be `null`.
///   - supportedLocales: An iterable of locales that the app supports.
///   - ctx: The build context to access the [LanguageCubit].
///   - state: The current language state which may contain the selected language and country codes.
///
/// - Returns: A [Locale] object that is either matched with the device's locale or the default locale.

Locale? _localeResolutionCallback({
  required Locale? deviceLocale,
  required Iterable<Locale> supportedLocales,
  required BuildContext context,
  required LanguageState state,
}) {
  final defaultLocale = supportedLocales.last;
  final matchedLocale = supportedLocales.firstWhereOrNull(
    (locale) => locale.languageCode == deviceLocale?.languageCode,
  );

  if (matchedLocale != null) {
    return matchedLocale;
  }

  if (state.languageCode == null) {
    context.read<LanguageCubit>().languageSelected(
          defaultLocale.languageCode,
          defaultLocale.countryCode,
        );
  }

  return defaultLocale;
}
