import 'package:intl/intl.dart';
import 'package:realtime_innovation_employee_app/core/constants/constants.dart';

class DateUtils {
  DateUtils._();

  static String getStringFormattedDate({
    DateTime? date,
    String? outputFormat = Constants.dateFormat1,
  }) {
    if (date == null) {
      return '';
    }

    DateFormat outputDateFormat = DateFormat(outputFormat);
    try {
      String result = outputDateFormat.format(date);
      return result;
    } catch (_) {}
    return '';
  }

  static DateTime getNextWeekday(DateTime currentDate, int targetedDay) {
    int daysUntilTarget = (targetedDay - currentDate.weekday) % 7;
    daysUntilTarget = daysUntilTarget == 0 ? 7 : daysUntilTarget;
    return currentDate.add(Duration(days: daysUntilTarget));
  }
}
