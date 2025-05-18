import 'package:intl/intl.dart';

class TimeUtils {
  // 获取当前时间
  static String now(String pattern) {
    final now = DateTime.now();
    final formatter = DateFormat(pattern);
    return formatter.format(now);
  }
}