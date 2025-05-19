import 'package:intl/intl.dart';

class TimeUtils {
  // 获取当前时间
  static String now(String pattern) {
    final now = DateTime.now();
    final formatter = DateFormat(pattern);
    return formatter.format(now);
  }

  static String formatTime(String? time, {String pattern = 'yyyy-MM-dd HH:mm'}) {
    if (time == null || time.isEmpty) return '-';
    try {
      final dt = DateTime.parse(time);
      return DateFormat(pattern ).format(dt);
    } catch (_) {
      return time.replaceFirst('T', ' '); // fallback
    }
  }
}