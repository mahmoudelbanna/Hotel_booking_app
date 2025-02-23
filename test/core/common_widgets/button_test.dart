import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hotel_booking_app/hotel_booking_app.dart';

void main() {
  const buttonText = 'Click Me';
  Widget createWidgetUnderTest(VoidCallback onPressed) {
    return MaterialApp(
      home: Scaffold(body: Button(onPressed: onPressed, text: buttonText)),
    );
  }

  testWidgets('Button displays correct text', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(() {}));
    final textFinder = find.text(buttonText);
    expect(textFinder, findsOneWidget);
  });

  testWidgets('Button calls onPressed when tapped', (
    WidgetTester tester,
  ) async {
    bool isPressed = false;
    void onPressed() {
      isPressed = true;
    }

    await tester.pumpWidget(createWidgetUnderTest(onPressed));

    final buttonFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFinder);
    await tester.pump();

    expect(isPressed, isTrue);
  });

  testWidgets('Button has correct style', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(() {}));

    final elevatedButtonFinder = find.byType(ElevatedButton);
    final elevatedButton = tester.widget<ElevatedButton>(elevatedButtonFinder);

    expect(
      elevatedButton.style?.backgroundColor?.resolve({WidgetState.selected}),
      Colors.orange,
    );

    final actualPadding = elevatedButton.style?.padding;

    expect(
      (actualPadding as WidgetStatePropertyAll<EdgeInsetsGeometry>).value,
      equals(const EdgeInsets.symmetric(vertical: 12)),
    );
  });
}
