import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/utils/network_info.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:tv_series/data/datasources/tv_local_data_source.dart';
import 'package:tv_series/data/datasources/tv_remote_data_source.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

@GenerateMocks([
  TvRepository,
  TvLocalDataSource,
  TvRemoteDataSource,
  DatabaseHelper,
  NetworkInfo,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
