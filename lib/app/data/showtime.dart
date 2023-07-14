part of 'data.dart';

class Showtime {
  final String id;
  final String movieId;
  final DateTime date;
  final TimeOfDay time;
  final Map<String, dynamic> seats;

  const Showtime({
    required this.id,
    required this.movieId,
    required this.date,
    required this.time,
    required this.seats,
  });

  factory Showtime.fromJson(Map<String, dynamic> data) => Showtime(
        id: data['id'],
        movieId: data['movieId'],
        date: data['date'] != null
            ? DateTime.parse(data['date'])
            : DateTime.now(),
        time: (data['time'] as String).formatTimeOfDay(),
        seats: json.decode(data['seats']),
      );
}
