import 'package:demo_app_10_6_2025/data/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator', () {
    final calculator = Calculator();

    test('adds two numbers', () {
      expect(calculator.add(2, 3), 5);
      expect(calculator.add(-1, 5), 4);
    });

    test('subtracts two numbers', () {
      expect(calculator.subtract(5, 2), 3);
      expect(calculator.subtract(0, 5), -5);
    });

    test('multiplies two numbers', () {
      expect(calculator.multiply(4, 3), 12);
      expect(calculator.multiply(-2, 2), -4);
    });

    test('divides two numbers', () {
      expect(calculator.divide(10, 2), 5);
      expect(calculator.divide(5, 2), 2.5);
    });

    test('throws exception on divide by zero', () {
      expect(() => calculator.divide(10, 0), throwsException);
    });
  });
}
