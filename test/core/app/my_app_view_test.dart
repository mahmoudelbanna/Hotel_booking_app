import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fake_app_router.dart';
import 'my_app_view_test.mocks.dart';


@GenerateMocks([LanguageCubit])
void main() {
  late MockLanguageCubit mockLanguageCubit;
  late FakeAppRouter fakeAppRouter;

  setUp(() {
    mockLanguageCubit = MockLanguageCubit();
    fakeAppRouter = FakeAppRouter();
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<LanguageCubit>(
      create: (context) => mockLanguageCubit,
      child: MyAppView(appRouter: fakeAppRouter),
    );
  }

  /// ✅ **Widget Test 1: MyAppView initializes correctly**
  testWidgets('MyAppView initializes with correct default locale and theme',
      (WidgetTester tester) async {
    // Arrange: Mock LanguageCubit state
    when(mockLanguageCubit.state).thenReturn(
      LanguageState(languageCode: 'en', countryCode: 'US'),
    );
    when(mockLanguageCubit.stream).thenAnswer(
      (_) => Stream.value(LanguageState(languageCode: 'en', countryCode: 'US')),
    );

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    final materialApp = tester.widget<MaterialApp>(
      find.byType(MaterialApp),
    );

    expect(materialApp.debugShowCheckedModeBanner, false);
    expect(materialApp.title, 'Hotel Booking App');
    expect(materialApp.locale, const Locale('en', 'US'));
  });

  /// ✅ **Widget Test 2: Locale updates when LanguageCubit state changes**
  testWidgets('MyAppView updates locale when LanguageCubit emits a new state',
      (WidgetTester tester) async {
    // Arrange: Initial state
    when(mockLanguageCubit.state).thenReturn(
      LanguageState(languageCode: 'en', countryCode: 'US'),
    );
    when(mockLanguageCubit.stream).thenAnswer(
      (_) => Stream.value(LanguageState(languageCode: 'de', countryCode: 'DE')),
    );

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Update the state
    when(mockLanguageCubit.state).thenReturn(
      LanguageState(languageCode: 'de', countryCode: 'DE'),
    );
    await tester.pump(); // Rebuild UI

    // Assert
    final materialApp = tester.widget<MaterialApp>(
      find.byType(MaterialApp),
    );

    expect(materialApp.locale, const Locale('de', 'DE'));
  });

  /// ✅ **Widget Test 3: MyAppView uses the provided AppRouter**
  testWidgets('MyAppView uses the provided AppRouter for navigation',
      (WidgetTester tester) async {
    // Arrange: Mock LanguageCubit state and stream
    when(mockLanguageCubit.state).thenReturn(
      LanguageState(languageCode: 'en', countryCode: 'US'),
    );
    when(mockLanguageCubit.stream).thenAnswer(
      (_) => Stream.value(LanguageState(languageCode: 'en', countryCode: 'US')),
    );

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(fakeAppRouter.routes, isNotEmpty); 
  });
}
