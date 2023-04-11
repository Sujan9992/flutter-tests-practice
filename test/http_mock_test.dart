import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_practice/main.dart';
import 'package:flutter_tests_practice/model/user.dart';

void main() {
  testWidgets(
    'display user lists with name and email',
    (widgetTester) async {
      final users = [
        User(id: 1, name: 'Joe', email: 'joe@email.com'),
        User(id: 2, name: 'Jaes', email: 'jaes@email.com')
      ];

      Future<List<User>> mockGetUser() =>
          Future.delayed(const Duration(seconds: 2), () => users);

      await widgetTester.pumpWidget(
        MaterialApp(home: HomePage(users: mockGetUser())),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wait for 2 seconds. keeps calling pump until future is resolved
      await widgetTester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (var user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
