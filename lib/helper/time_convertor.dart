import 'package:date_time_format/date_time_format.dart';

class DateTimeConvertor {
  String? finalDate;

  ///This functtion will help us get relevant time.
  /// It will help get The "Todya, yestarday fomat."
  String? getRelativeDate(DateTime date) {
    int calculateDifference(DateTime date) {
      var dateTime = DateTime.now();
      return DateTime(date.year, date.month, date.day)
          .difference(DateTime(dateTime.year, dateTime.month, dateTime.day))
          .inDays;
    }

    switch (calculateDifference(date)) {
      case 0:
        finalDate = 'Today';
        break;
      case -1:
        finalDate = 'Yesterday';
        break;

      default:
        var formatter = DateTimeFormat.format(date, format: 'l, M j');
        finalDate = formatter;
        break;
    }

    return finalDate;
  }
}
