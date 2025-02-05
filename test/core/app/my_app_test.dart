import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'my_app_test.mocks.dart';

@GenerateMocks([InternetCubit, LanguageCubit, Storage])
void main() {
  late MockInternetCubit mockInternetCubit;
  late MockLanguageCubit mockLanguageCubit;

  late MockStorage mockStorage;

  setUp(() {
    mockInternetCubit = MockInternetCubit();
    mockLanguageCubit = MockLanguageCubit();
    mockStorage = MockStorage();
    HydratedBloc.storage = mockStorage;
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => mockInternetCubit,
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => mockLanguageCubit,
        ),
      ],
      child: MyApp(),
    );
  }

  testWidgets('MyApp widget test', (WidgetTester tester) async {
    // Arrange
    when(mockInternetCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const InternetConnected(),
      ]),
    );

    when(mockLanguageCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        LanguageState(languageCode: 'en', countryCode: 'EN'),
      ]),
    );

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(MyAppView), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that the Cubits are provided correctly
    final internetCubit =
        BlocProvider.of<InternetCubit>(tester.element(find.byType(MyApp)));
    expect(internetCubit, equals(mockInternetCubit));
    
    final languageCubit =
        BlocProvider.of<LanguageCubit>(tester.element(find.byType(MyApp)));
    expect(languageCubit, equals(mockLanguageCubit));
  });
}
