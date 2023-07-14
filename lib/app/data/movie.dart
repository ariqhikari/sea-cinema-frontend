part of 'data.dart';

class Movie {
  final String id;
  final String title;
  final String description;
  final String releaseDate;
  final String duration;
  final String poster;
  final num rating;
  final int ageRating;
  final int price;
  final List<String> genres;

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.duration,
    required this.poster,
    required this.rating,
    required this.ageRating,
    required this.price,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> data) => Movie(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        releaseDate: data['release_date'],
        duration: data['duration'],
        poster: data['poster'],
        rating: data['rating'],
        ageRating: data['age_rating'],
        price: data['price'],
        genres: (json.decode(data['genres']) as List)
            .map((item) => item as String)
            .toList(),
      );
}
