import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/annotations.dart';

import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/mockito.dart';

import 'locale_helper_test.mocks.dart';

@GenerateMocks([LanguageCubit])
void main() {
  late MockLanguageCubit mockLanguageCubit;

  setUp(() {
    mockLanguageCubit = MockLanguageCubit();
    when(mockLanguageCubit.state)
        .thenReturn(LanguageState(languageCode: 'en', countryCode: 'US'));

    when(mockLanguageCubit.stream).thenAnswer((_) =>
        Stream.value(LanguageState(languageCode: 'en', countryCode: 'US')));
  });

  Widget createWidgetUnderTest(Widget child) {
    return BlocProvider<LanguageCubit>(
      create: (context) => mockLanguageCubit,
      child: child,
    );
  }

  group('resolveLocale', () {
    const supportedLocales = [
      Locale('en', 'US'),
      Locale('de', 'DE'),
    ];

    testWidgets('returns locale from LanguageState if languageCode is not null',
        (WidgetTester tester) async {
      final state = LanguageState(languageCode: 'de', countryCode: 'DE');

      await tester.pumpWidget(createWidgetUnderTest(Builder(
        builder: (context) {
          final locale = resolveLocale(
            deviceLocale: const Locale('en', 'US'),
            supportedLocales: supportedLocales,
            context: context,
            state: state,
          );
          expect(locale, const Locale('de', 'DE'));
          verifyNever(mockLanguageCubit.languageSelected(any, any));
          return const SizedBox();
        },
      )));
    });

    testWidgets(
        'matches deviceLocale language code with supportedLocales and updates LanguageCubit',
        (WidgetTester tester) async {
      final state = LanguageState(languageCode: null, countryCode: null);

      await tester.pumpWidget(createWidgetUnderTest(Builder(
        builder: (context) {
          final locale = resolveLocale(
            deviceLocale: const Locale('en', 'US'),
            supportedLocales: supportedLocales,
            context: context,
            state: state,
          );

          expect(locale, const Locale('en', 'US'));
          verify(mockLanguageCubit.languageSelected(any, any)).called(1);
          return const SizedBox();
        },
      )));
    });

    testWidgets(
        'falls back to first supported locale when no language code matches',
        (WidgetTester tester) async {
      final state = LanguageState(languageCode: null, countryCode: null);

      await tester.pumpWidget(createWidgetUnderTest(Builder(
        builder: (context) {
          final locale = resolveLocale(
            deviceLocale: const Locale('es', 'ES'),
            supportedLocales: supportedLocales,
            context: context,
            state: state,
          );

          expect(locale, const Locale('en', 'US'));
          verify(mockLanguageCubit.languageSelected(any, any)).called(1);

          return const SizedBox();
        },
      )));
    });

    testWidgets('falls back to first supported locale if deviceLocale is null',
        (WidgetTester tester) async {
      final state = LanguageState(languageCode: null, countryCode: null);

      await tester.pumpWidget(createWidgetUnderTest(Builder(
        builder: (context) {
          final locale = resolveLocale(
            deviceLocale: null,
            supportedLocales: supportedLocales,
            context: context,
            state: state,
          );

          expect(locale, const Locale('en', 'US'));
          verify(mockLanguageCubit.languageSelected(any, any)).called(1);
          return const SizedBox();
        },
      )));
    });
  });
}
