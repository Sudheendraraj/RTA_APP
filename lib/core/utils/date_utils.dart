class AppDateUtils {
  static String getStartOfToday() {
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
    ).toIso8601String();
  }

  static String getEndOfToday() {
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      23,
      59,
      59,
    ).toIso8601String();
  }

  static int getCurrentYear() {
    return DateTime.now().year;
  }
}