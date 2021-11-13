import 'package:core/data/models/genre_model.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return entities genre when toEntity() function called', () {
    // arrange
    final genreModel = GenreModel(id: 1, name: 'action');
    // act
    final genre = genreModel.toEntity();
    // assert
    expect(genre, Genre(id: 1, name: 'action'));
  });
}
