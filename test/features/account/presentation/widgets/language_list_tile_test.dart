import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart'; // Adjust the import as needed

void main() {
  Widget createWidgetUnderTest(final String text, final String value,
      final String groupValue, final LanguageTitleOnTap onChanged) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: LanguageListTile(
          text: text,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }

  group('LanguageListTile', () {
    testWidgets('displays the correct text and unselected radio button',
        (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          'English',
          'en',
          'de', // Not selected
          (_) {},
        ),
      );

      expect(find.text('English'), findsOneWidget);
      expect(find.byType(Radio<String>), findsOneWidget);

      final radio = tester.widget<Radio<String>>(find.byType(Radio<String>));
      expect(radio.groupValue, 'de'); // Not selected
      expect(radio.value, 'en');
      expect(radio.value == radio.groupValue, isFalse);
    });

    testWidgets('marks radio as selected when value matches groupValue',
        (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          'German',
          'de',
          'de', // Selected
          (_) {},
        ),
      );

      final radio = tester.widget<Radio<String>>(find.byType(Radio<String>));
      expect(radio.value, 'de');
      expect(radio.groupValue, 'de');
      expect(radio.value == radio.groupValue, isTrue); // Should be selected
    });

    testWidgets('calls onChanged when radio button is tapped', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        createWidgetUnderTest(
          'English',
          'en',
          'de', // Initially unselected
          (value) {
            selectedValue = value;
          },
        ),
      );

      final radioFinder = find.byType(Radio<String>);

      expect(selectedValue, isNull); 

      await tester.tap(radioFinder); 
      await tester.pumpAndSettle();

      expect(
          selectedValue, equals('en')); // onChanged should have been triggered
    });
  });
}
