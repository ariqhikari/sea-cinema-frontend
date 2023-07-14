part of 'extensions.dart';

extension TimeOfDayExtension on TimeOfDay {
  String formatString() {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, hour, minute);
    final format = DateFormat.Hm();
    return format.format(dt);
  }
}
