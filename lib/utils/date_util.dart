import 'package:intl/intl.dart';

class Util {
  
  static String tDateFormatted(DateTime dateTime) {
    return DateFormat("EEE MM - d - y").format(dateTime);
  }

  static String mDateFormatted(DateTime dateTime) {
    return DateFormat("d - MM - y").format(dateTime);
  }

  static String toDateFormatted(DateTime dateTime) {
    return DateFormat("j").format(dateTime);
  }

  static String toDayFormatted(DateTime dateTime) {
    return DateFormat("EEEE").format(dateTime);
  }
}