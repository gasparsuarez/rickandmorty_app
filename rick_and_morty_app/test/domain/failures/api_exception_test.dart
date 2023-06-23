import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/domain/failures/api_exception.dart';

void main() {
  group('Api Exception test ->', () {
    final exception = ApiException('Message');
    test('Api Exception', () {
      expect(exception, isA<Exception>());
    });
    test('Api Exception [toString]', () {
      expect(exception.toString(), 'ApiException: Message');
    });
  });
}
