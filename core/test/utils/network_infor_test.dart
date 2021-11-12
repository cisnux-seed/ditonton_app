import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/utils/network_info.dart';
import 'package:mockito/annotations.dart';
import 'network_infor_test.mocks.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([DataConnectionChecker])
void main() {
  late final MockDataConnectionChecker mockDataConnectionChecker;
  late final NetworkInfo networkInfo;

  setUpAll(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('network info', () {
    test('should return true when device connected to internet', () async {
      // arrange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);
      // act
      final result = await networkInfo.isConnected;
      // assert
      expect(result, true);
    });

    test('should return false when device connected to internet', () async {
      // arrange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);
      // act
      final result = await networkInfo.isConnected;
      // assert
      expect(result, false);
    });
  });
}
