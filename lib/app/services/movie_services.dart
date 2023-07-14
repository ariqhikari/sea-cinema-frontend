part of 'services.dart';

class MovieServices {
  static Future<ApiReturnValue<List<Movie>>> nowPlaying() async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/movies/now-playing';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'token': token,
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    List<Movie> movies = (data['body']['data']['movies'] as Iterable)
        .map((movie) => Movie.fromJson(movie))
        .toList();

    return ApiReturnValue(value: movies);
  }

  static Future<ApiReturnValue<List<Movie>>> movieByGenre(String genre) async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/movies/genre/${genre}';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'token': token,
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    List<Movie> movies = (data['body']['data']['movies'] as Iterable)
        .map((movie) => Movie.fromJson(movie))
        .toList();

    return ApiReturnValue(value: movies);
  }
}
