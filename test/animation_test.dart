import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_practice/main.dart';

void main() {
  testWidgets(
    'Animated container test',
    (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(home: AnimatedScreen()));

      var containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      var container = widgetTester.widget<Container>(containerFinder);

      expect(container.constraints!.minWidth, 50);
      expect(container.constraints!.minHeight, 50);
      expect((container.decoration! as BoxDecoration).color, Colors.red);
      expect((container.decoration! as BoxDecoration).borderRadius,
          BorderRadius.zero);

      await widgetTester.pumpAndSettle();

      containerFinder = find.byType(Container);
      container = widgetTester.widget<Container>(containerFinder);

      expect(container.constraints!.minWidth, 200);
      expect(container.constraints!.minHeight, 200);
      expect((container.decoration! as BoxDecoration).color, Colors.blue);
      expect((container.decoration! as BoxDecoration).borderRadius,
          BorderRadius.circular(100));
    },
  );
}
