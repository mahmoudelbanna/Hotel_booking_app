import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'language_view_test.mocks.dart';

@GenerateMocks([LanguageCubit])
void main() {
  group('LanguageView', () {
    late MockLanguageCubit mockLanguageCubit;

    setUp(() {
      mockLanguageCubit = MockLanguageCubit();
    });

    tearDown(() {
      mockLanguageCubit.close();
    });

    Widget createWidgetUnderTest() {
      return BlocProvider<LanguageCubit>(
        create: (context) => mockLanguageCubit,
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: LanguageView(),
          ),
        ),
      );
    }

    testWidgets('displays German and English language options', (tester) async {
      when(mockLanguageCubit.state)
          .thenReturn(LanguageState(languageCode: 'en', countryCode: 'US'));
      when(mockLanguageCubit.stream)
          .thenAnswer((_) => Stream.value(LanguageState(
                languageCode: 'en',
                countryCode: 'US',
              )));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(LanguageListTile), findsNWidgets(2));
      expect(find.text('English'), findsOneWidget);
      expect(find.text('German'), findsOneWidget);
    });

    testWidgets('calls languageSelected when a language is selected',
        (tester) async {
      // Initial state
      when(mockLanguageCubit.state)
          .thenReturn(LanguageState(languageCode: 'de', countryCode: 'DE'));
      when(mockLanguageCubit.stream).thenAnswer((_) => Stream.value(
            LanguageState(languageCode: 'de', countryCode: 'DE'),
          ));

      await tester.pumpWidget(createWidgetUnderTest());

      // Find the Radio associated with English
      final englishRadio = find.descendant(
        of: find.widgetWithText(LanguageListTile, 'English'),
        matching: find.byWidgetPredicate((widget) => widget is Radio<String>),
      );

      expect(englishRadio, findsOneWidget);

      await tester.tap(englishRadio);
      await tester.pumpAndSettle();

      verify(mockLanguageCubit.languageSelected('en', 'DE')).called(1);
    });
  });
}
