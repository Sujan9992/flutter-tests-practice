import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tests_practice/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'integration testing',
    () {
      testWidgets(
        'verify login with correct credentials and route to home screen',
        (widgetTester) async {
          // call the main function of the app from main.dart to call runApp() function
          app.main();
          // executes all the frames that are scheduled to run
          await widgetTester.pumpAndSettle();
          // returns the first widget that matches the given finder
          await widgetTester.enterText(
              find.byType(TextField).at(0), 'username');
          await widgetTester.enterText(
              find.byType(TextField).at(1), 'password');

          await widgetTester.tap(find.byType(TextButton));
          // wait for the next screen to load
          await widgetTester.pumpAndSettle();

          expect(find.byType(app.HomeUI), findsOneWidget);
        },
      );

      testWidgets(
        'verify login with incorrect credentials',
        (widgetTester) async {
          // call the main function of the app from main.dart to call runApp() function
          app.main();
          // executes all the frames that are scheduled to run
          await widgetTester.pumpAndSettle();
          // returns the first widget that matches the given finder
          await widgetTester.enterText(
              find.byKey(const Key('username')), 'username1');
          await widgetTester.enterText(
              find.byKey(const Key('password')), 'password1');

          await widgetTester.tap(find.byType(TextButton));
          // wait for the next screen to load
          await widgetTester.pumpAndSettle();

          expect(find.byType(AlertDialog), findsOneWidget);
        },
      );
    },
  );
}
