import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

/// Resolves the appropriate locale for the application.
///
/// This function attempts to determine the locale that should be used based on the provided
/// [deviceLocale], [supportedLocales], and the current [state] of the [LanguageCubit].
///
/// If the [state] contains a [languageCode], a new [Locale] is created and returned using the
/// language and country code from the [state].
///
/// If the [state] does not specify a language, the function searches for a matching locale in
/// [supportedLocales] that has the same language code as the [deviceLocale]. If a match is found,
/// it is returned; otherwise, the first locale in [supportedLocales] is selected as the default.
///
/// The selected locale is then used to update the [LanguageCubit] with the chosen language and
/// country code.
///
/// Returns the resolved [Locale] for the application.

Locale? resolveLocale({
  required Locale? deviceLocale,
  required Iterable<Locale> supportedLocales,
  required BuildContext context,
  required LanguageState state,
}) {
  if (state.languageCode != null) {
    return Locale(state.languageCode!, state.countryCode);
  }

  final matchedLocale = supportedLocales.firstWhereOrNull(
    (locale) => locale.languageCode == deviceLocale?.languageCode,
  );

  final defaultLocale = matchedLocale ?? supportedLocales.first;

  context.read<LanguageCubit>().languageSelected(
    defaultLocale.languageCode,
    defaultLocale.countryCode,
  );

  return defaultLocale;
}
