import 'package:intl/intl.dart';

class AppConstance {
  static const String themeKey = "THEME_MODE";

  static const String dbName = "task.db";
  static const String dbTableName = "taskTable";
  static String selectedDate = DateFormat("yMd").format(DateTime.now());

  static DateTime dateTime = DateTime.now();
  static const String idColumn = "id";
  static const String isCompletedColumn = "isCompleted";
  static const String titleColumn = "title";
  static const String colorColumn = "color";
  static const String remindColumn = "remind";
  static const String noteColumn = "note";
  static const String dateColumn = "date";
  static const String startTimeColumn = "startTime";
  static const String endTimeColumn = "endTime";
  static const String repeatColumn = "repeat";
}
