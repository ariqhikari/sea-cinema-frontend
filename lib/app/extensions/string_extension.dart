part of 'extensions.dart';

extension StringExtension on String {
  TimeOfDay formatTimeOfDay() {
    final format = DateFormat.Hm();
    return TimeOfDay.fromDateTime(format.parse(this));
  }
}
