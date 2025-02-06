import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../hotel_booking_app.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
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

  ThemeData _themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      useMaterial3: true,
    );
  }
}
