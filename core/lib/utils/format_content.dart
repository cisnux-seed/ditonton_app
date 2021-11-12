import 'package:core/domain/entities/genre.dart';

String showGenres(List<Genre> genres) =>
    genres.isNotEmpty ? genres.map((genre) => genre.name).join(', ') : '';

String showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}
