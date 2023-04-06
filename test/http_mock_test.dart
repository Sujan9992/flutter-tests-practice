import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_practice/model/user.dart';
import 'package:flutter_tests_practice/repository/user_repo.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });
  group('http mock - UserRepository', () {
    group('getUser function', () {
      test('check status code is 200 and returns a user model', () async {
        when(() => mockHTTPClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer((_) async => Response('''
              {
                "id": 1,
                "name": "Leanne Graham",
                "username": "Bret",
                "email": "Sincere@april.biz",
                "address": {
                  "street": "Kulas Light",
                  "suite": "Apt. 556",
                  "city": "Gwenborough",
                  "zipcode": "92998-3874",
                  "geo": {
                    "lat": "-37.3159",
                    "lng": "81.1496"
                  }
                },
                "phone": "1-770-736-8031 x56442",
                "website": "hildegard.org",
                "company": {
                  "name": "Romaguera-Crona",
                  "catchPhrase": "Multi-layered client-server neural-net",
                  "bs": "harness real-time e-markets"
                }
              }
 ''', 200));

        final user = await userRepository.getUser();
        expect(user, isA<User>());
      });

      test('check status code is other than 200 and returns an arror',
          () async {
        when(() => mockHTTPClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer((_) async => Response('{}', 500));

        final user = userRepository.getUser();
        expect(user, throwsException);
      });
    });
  });
}
