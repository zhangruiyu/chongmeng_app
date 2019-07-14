import 'package:intl/intl.dart';

class DateUtils {
  static String formatData(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String toDay() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static DateTime toDayDateTime() {
    return DateTime.parse(toDay());
  }
}
