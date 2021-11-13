import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/utils/network_info.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/data/datasources/movie_local_data_source.dart';
import 'package:movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies/domain/repositories/movie_repository.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  NetworkInfo,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
