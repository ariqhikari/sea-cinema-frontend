part of 'extensions.dart';

extension MovieExtension on Movie {
  String get getGenres {
    return this.genres.join(", ");
  }
}
