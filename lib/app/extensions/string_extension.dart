part of 'extensions.dart';

extension StringExtension on String {
  TimeOfDay formatTimeOfDay() {
    final format = DateFormat.Hm();
    return TimeOfDay.fromDateTime(format.parse(this));
  }

  bool isDigit(int index) =>
      this.codeUnitAt(index) >= 48 && this.codeUnitAt(index) <= 57;
}
