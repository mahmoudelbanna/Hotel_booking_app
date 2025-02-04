import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final countryCode =
        context.watch<LanguageCubit>().state.countryCode ?? '';
    final languageCode =
        context.watch<LanguageCubit>().state.languageCode ?? '';
    final germanLocale = AppLocalizations.supportedLocales[0];
    final englishLocale = AppLocalizations.supportedLocales[1];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LanguageListTile(
            text: context.l10n.german,
            value: germanLocale.languageCode,
            groupValue: languageCode,
            onChanged: (value) =>
                context.read<LanguageCubit>().languageSelected(value, countryCode),
          ),
          LanguageListTile(
            text: context.l10n.english,
            value: englishLocale.languageCode,
            groupValue: languageCode,
            onChanged: (value) =>
                context.read<LanguageCubit>().languageSelected(value, countryCode),
          ),
        ],
      ),
    );
  }
}
