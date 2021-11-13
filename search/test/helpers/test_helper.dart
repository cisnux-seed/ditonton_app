import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

@GenerateMocks([
  MovieRepository,
  TvRepository,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
