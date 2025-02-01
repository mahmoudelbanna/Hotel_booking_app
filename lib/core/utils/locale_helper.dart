import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

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
///   - context: The build context to access the [LanguageCubit].
///   - state: The current language state which may contain the selected language and country codes.
///
/// - Returns: A [Locale] object that is either matched with the device's locale or the default locale.
Locale? resolveLocale({
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
