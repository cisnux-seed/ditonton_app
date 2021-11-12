import 'package:core/utils/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return base64(String) when encrypted string ', () {
    final password = 'Cisnux@12';

    final encrypted = encrypt(password);

    expect(encrypted, isA<String>());
  });
}
