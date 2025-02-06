import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

/// Resolves the best matching locale for the given device locale and supported locales.
///
/// If the device locale is not supported, it will fall back to the first locale in the
/// list of supported locales that matches the language code of the device locale.
/// If no language code matches, it will fall back to the last locale in the list of
/// supported locales.
///
/// If the resolved locale is different from the current language and country code in
/// the [LanguageState], it will call [LanguageCubit.languageSelected] to update the
/// state.
///
/// Returns the resolved locale.
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
      (locale) => locale.languageCode == deviceLocale?.languageCode);

  final defaultLocale = matchedLocale ?? supportedLocales.first;

  context
      .read<LanguageCubit>()
      .languageSelected(defaultLocale.languageCode, defaultLocale.countryCode);

  return defaultLocale;
}
