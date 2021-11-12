import 'package:core/utils/format_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('show duration', () {
    test('should return minutes format when runtime less than or equal to 60',
        () {
      // arrange
      final runtime = 50;
      // act
      final formatDuration = showDuration(runtime);
      // assert
      expect(formatDuration, '50m');
    });

    test(
        'should return hours and minuts format when runtime greater than or equal to 60',
        () {
      // arrange
      final runtime = 70;
      // act
      final formatDuration = showDuration(runtime);
      // assert
      expect(formatDuration, '1h 10m');
    });
  });
}
