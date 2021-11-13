import 'package:core/data/models/genre_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('genre model', () {
    test('should return genre model when fromJson() function called', () {
      // arrange
      const tGenreMap = <String, dynamic>{'id': 1, 'name': 'action'};
      // act
      final genreModel = GenreModel.fromJson(tGenreMap);
      // assert
      expect(genreModel, GenreModel(id: 1, name: 'action'));
    });

    test('should return genre map when toJson() function called', () {
      // arrange
      const tGenreMap = <String, dynamic>{'id': 1, 'name': 'action'};
      // act
      final genreModel = GenreModel(id: 1, name: 'action').toJson();
      // assert
      expect(genreModel, tGenreMap);
    });
  });
}
