import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart'; // Adjust the import as needed

void main() {
  Widget createWidgetUnderTest(
    final String text,
    final String value,
    final String groupValue,
    final void Function(String) onChanged,
  ) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: RadioGroup<String>(
          groupValue: groupValue,
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          child: LanguageListTile(text: text, value: value),
        ),
      ),
    );
  }

  group('LanguageListTile', () {
    testWidgets('displays the correct text and unselected radio button', (
      tester,
    ) async {
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
      final radioGroup = tester.widget<RadioGroup<String>>(
        find.byType(RadioGroup<String>),
      );
      expect(radioGroup.groupValue, 'de'); // Not selected
      expect(radio.value, 'en');
      expect(radio.value == radioGroup.groupValue, isFalse);
    });

    testWidgets('marks radio as selected when value matches groupValue', (
      tester,
    ) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          'German',
          'de',
          'de', // Selected
          (_) {},
        ),
      );

      final radio = tester.widget<Radio<String>>(find.byType(Radio<String>));
      final radioGroup = tester.widget<RadioGroup<String>>(
        find.byType(RadioGroup<String>),
      );
      expect(radio.value, 'de');
      expect(radioGroup.groupValue, 'de');
      expect(
        radio.value == radioGroup.groupValue,
        isTrue,
      ); // Should be selected
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
        selectedValue,
        equals('en'),
      ); // onChanged should have been triggered
    });
  });
}
