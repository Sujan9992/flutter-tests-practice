import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_practice/main.dart';

void main() {
  testWidgets(
    'given counter is 0 when increment is clicked',
    (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(home: MyHomePage()));

      final ctr1 = find.text('0');
      expect(ctr1, findsOneWidget);

      final ctr2 = find.text('1');
      expect(ctr2, findsNothing);

      // only if there exists one FloatingActionButton
      // final incrementBtn = find.byType(FloatingActionButton);
      // if there are multiple FloatingActionButton use key
      final incrementBtn = find.byKey(const Key('increment'));
      await widgetTester.tap(incrementBtn);
      // when setState is called, pump() is required
      await widgetTester.pump();

      final ctr3 = find.text('1');
      expect(ctr3, findsOneWidget);

      final ctr4 = find.text('0');
      expect(ctr4, findsNothing);

      expect(find.byType(AppBar), findsOneWidget);
    },
  );
}
