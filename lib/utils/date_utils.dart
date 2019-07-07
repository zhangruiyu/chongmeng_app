import 'package:intl/intl.dart';

class DateUtils {
  static String formatData(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
