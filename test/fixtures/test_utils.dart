import 'package:auto_route/auto_route.dart';
import 'package:flutter_test/flutter_test.dart';


void expectTopPage(StackRouter router, String name) {
  expect(router.topRoute.name, name);
  expect(find.text(name), findsOneWidget);
}
