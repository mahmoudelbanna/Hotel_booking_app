import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  late final List<String> options;
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    options = [
      AppLocalizations.supportedLocales[0].languageCode,
      AppLocalizations.supportedLocales[1].languageCode
    ];
    selectedLanguage = options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          LanguageListTile(
            text: context.l10n.german,
            value: options[0],
            groupValue: selectedLanguage,
            onChanged: (value) {
              context.read<LanguageCubit>().languageSelected(
                  AppLocalizations.supportedLocales[0].languageCode, 'DE');
              setState(
                () {
                  selectedLanguage = value.toString();
                },
              );
            },
          ),
          LanguageListTile(
            text: context.l10n.english,
            value: options[1],
            groupValue: selectedLanguage,
            onChanged: (value) {
              context.read<LanguageCubit>().languageSelected(
                  AppLocalizations.supportedLocales[1].languageCode, 'US');
              setState(
                () {
                  selectedLanguage = value.toString();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
