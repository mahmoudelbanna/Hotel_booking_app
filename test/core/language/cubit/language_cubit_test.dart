import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:hotel_booking_app/hotel_booking_app.dart';

import '../../../fixtures/test_mocks.mocks.dart';

void main() {
  group('LanguageCubit', () {
    late LanguageCubit languageCubit;
    late MockStorage mockStorage;

    setUp(() {
      mockStorage = MockStorage();
      HydratedBloc.storage = mockStorage;
      languageCubit = LanguageCubit();
    });

    tearDown(() {
      languageCubit.close();
    });

    test('initial state is LanguageState', () {
      expect(languageCubit.state, const LanguageState());
    });

    blocTest<LanguageCubit, LanguageState>(
      'emits updated state when languageSelected is called',
      build: () => languageCubit,
      act: (cubit) => cubit.languageSelected('de', 'DE'),
      expect:
          () => [const LanguageState(languageCode: 'de', countryCode: 'DE')],
    );

    blocTest<LanguageCubit, LanguageState>(
      'emits updated state when languageSelected is called with null countryCode',
      build: () => languageCubit,
      act: (cubit) => cubit.languageSelected('en', null),
      expect:
          () => [const LanguageState(languageCode: 'en', countryCode: null)],
    );

    group('Hydration', () {
      test('fromJson returns correct state', () {
        final json = {'languageCode': 'de', 'countryCode': 'DE'};
        expect(
          languageCubit.fromJson(json),
          const LanguageState(languageCode: 'de', countryCode: 'DE'),
        );
      });

      test('toJson returns correct map', () {
        final state = const LanguageState(
          languageCode: 'de',
          countryCode: 'DE',
        );
        expect(languageCubit.toJson(state), {
          'languageCode': 'de',
          'countryCode': 'DE',
        });
      });
    });
  });
}
