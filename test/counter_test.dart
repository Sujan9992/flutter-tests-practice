import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_practice/model/counter.dart';

void main() {
  late Counter counter;
  // pre test
  // setup -> test1 -> setup -> test2 -> setup -> test3
  setUp(() => counter = Counter());

  // run once before all tests
  // setupAll -> test1 -> test2 -> test3
  setUpAll(() {});
  group('Counter Class', () {
    test('check count getter', () {
      int count = counter.count;
      expect(count, 0);
    });
  });
  test('check increment function', () {
    counter.increment();
    int count = counter.count;
    expect(count, 1);
  });
  test('check decrement function', () {
    counter.decrement();
    int count = counter.count;
    expect(count, -1);
  });
  test('check reset function', () {
    counter.reset();
    int count = counter.count;
    expect(count, 0);
  });

  // post test
  // tearDown -> test1 -> tearDown -> test2 -> tearDown -> test3
  tearDown(() => null);
  // test1 -> test2 -> test3 -> tearDownAll
  tearDownAll(() => null);
}
