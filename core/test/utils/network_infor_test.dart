import 'package:flutter_test/flutter_test.dart';
import 'package:core/utils/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'network_infor_test.mocks.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late final MockInternetConnectionChecker mockInternetConnectionChecker;
  late final NetworkInfo networkInfo;

  setUpAll(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('network info', () {
    test('should return true when device connected to internet', () async {
      // arrange
      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);
      // act
      final result = await networkInfo.isConnected;
      // assert
      expect(result, true);
    });

    test('should return false when device connected to internet', () async {
      // arrange
      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);
      // act
      final result = await networkInfo.isConnected;
      // assert
      expect(result, false);
    });
  });
}
