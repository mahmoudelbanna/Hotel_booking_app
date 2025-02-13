import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:hotel_booking_app/hotel_booking_app.dart';

import '../../../../fixtures/fake_app_router.dart';
import '../../../../fixtures/test_mocks.mocks.dart';
import '../../../../fixtures/test_utils.dart';



void main() {
  late FakeAppRouter fakeAppRouter;
  late MockLanguageCubit languageCubit;

  setUp(() {
    fakeAppRouter = FakeAppRouter();
    languageCubit = MockLanguageCubit();
    when(
      languageCubit.state,
    ).thenReturn(LanguageState(languageCode: 'en', countryCode: 'US'));
    when(languageCubit.stream).thenAnswer(
      (_) => Stream.value(LanguageState(languageCode: 'en', countryCode: 'US')),
    );
  });

  tearDown(() {
    languageCubit.close();
  });

  Future<void> pumpRouterConfigApp(WidgetTester tester) {
    return tester
        .pumpWidget(
          BlocProvider<LanguageCubit>(
            create: (context) => languageCubit,
            child: MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: fakeAppRouter.config(
                deepLinkBuilder: (_) => DeepLink.single(AccountRoute()),
              ),
            ),
          ),
        )
        .then((_) => tester.pumpAndSettle());
  }

  testWidgets('AccountPage has expected elements and navigates correctly', (
    tester,
  ) async {
    // Arrange
    await pumpRouterConfigApp(tester);

    expect(find.byType(ProfileElement), findsNWidgets(4));

    final languageButton = find.byKey(const ValueKey(kLanguageValueKey));

    expect(languageButton, findsOneWidget);

    expect(find.byIcon(Icons.language), findsOneWidget);

    await tester.tap(languageButton);
    await tester.pumpAndSettle();

    expectTopPage(fakeAppRouter, LanguageRoute.name);
  });
}
