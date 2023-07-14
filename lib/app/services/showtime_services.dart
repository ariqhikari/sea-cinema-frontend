part of 'services.dart';

class ShowtimeServices {
  static Future<ApiReturnValue<List<Showtime>>> showtimeById(
      String movieId) async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/showtimes/$movieId';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'token': token,
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    List<Showtime> showtimes = (data['body']['data']['showtimes'] as Iterable)
        .map((showtime) => Showtime.fromJson(showtime))
        .toList();

    return ApiReturnValue(value: showtimes);
  }
}
