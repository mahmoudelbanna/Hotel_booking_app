import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Mock callback function
class MockNavBarOnTap extends Mock {
  void call(int index);
}

void main() {
  late MockNavBarOnTap mockOnTap;
  setUp(() {
    mockOnTap = MockNavBarOnTap();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      locale: const Locale('en'),
      home: Scaffold(
        bottomNavigationBar: NavBar(
          onTap: mockOnTap.call,
          currentIndex: 0,
        ),
      ),
    );
  }

  testWidgets('NavBar renders correctly and responds to taps',
      (WidgetTester tester) async {
    // Build NavBar widget with proper localization setup
    await tester.pumpWidget(createWidgetUnderTest());

    // Verify NavBar is displayed
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Hotels'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);

    // Verify all four icons are present
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.hotel), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    // Tap on the 'Hotels' icon (index 1)
    await tester.tap(find.byIcon(Icons.hotel));
    await tester.pump();

    // Verify the mock callback is triggered with the correct index
    verify(mockOnTap(1)).called(1);

    // Tap on the 'Favorites' icon (index 2)
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify the callback is triggered with index 2
    verify(mockOnTap(2)).called(1);
  });
}
