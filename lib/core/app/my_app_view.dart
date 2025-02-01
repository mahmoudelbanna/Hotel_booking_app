import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '../../hotel_booking_app.dart';

class MyAppView extends StatelessWidget {
  MyAppView({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      buildWhen: (previous, current) =>
          previous.languageCode != current.languageCode,
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Hotel Booking App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: (deviceLocale, supportedLocales) {
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
          },
          locale: state.languageCode != null && state.countryCode != null
              ? Locale(state.languageCode!, state.countryCode!)
              : null,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
