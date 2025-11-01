import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_booking_app/hotel_booking_app.dart';

import '../../../../fixtures/test_mocks.mocks.dart';

void main() {
  late MockInternetCubit mockInternetCubit;

  setUp(() {
    mockInternetCubit = MockInternetCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<InternetCubit>.value(
        value: mockInternetCubit,
        child: const NoConnectionHomeErrorLoading(),
      ),
    );
  }

  testWidgets('displays "No internet connection" when InternetDisconnected', (
    WidgetTester tester,
  ) async {
    // Arrange
    when(
      mockInternetCubit.state,
    ).thenReturn(const InternetState.disconnected());
    when(mockInternetCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([const InternetState.disconnected()]),
    );

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(); // Allow widget to build

    // Assert
    expect(find.byIcon(Icons.signal_wifi_off), findsOneWidget);
    expect(find.text("No internet connection"), findsOneWidget);
  });

  testWidgets('animates the icon with ScaleTransition', (
    WidgetTester tester,
  ) async {
    when(
      mockInternetCubit.state,
    ).thenReturn(const InternetState.disconnected());
    when(mockInternetCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([const InternetState.disconnected()]),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // Find the ScaleTransition containing the specific Icon
    final scaleTransitionFinder = find.descendant(
      of: find.byType(ScaleTransition),
      matching: find.byIcon(Icons.signal_wifi_off),
    );

    expect(scaleTransitionFinder, findsOneWidget);
  });
}
