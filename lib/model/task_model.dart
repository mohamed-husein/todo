import 'package:todo/core/utils/app_constants.dart';

class TaskModel {
  final int? id;
  final int isCompleted;
  final String color;
  final int remind;
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final String repeat;

  TaskModel({
     this.id,
    required this.isCompleted,
    required this.color,
    required this.remind,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.repeat,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      isCompleted: json["isCompleted"],
      color: json["color"],
      remind: json["remind"],
      title: json["title"],
      note: json["note"],
      date: json["date"],
      startTime: json["startTime"],
      endTime: json["endTime"],
      repeat: json["repeat"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppConstance.idColumn: id,
      AppConstance.isCompletedColumn: isCompleted,
      AppConstance.colorColumn: color,
      AppConstance.remindColumn: remind,
      AppConstance.titleColumn: title,
      AppConstance.noteColumn: note,
      AppConstance.dateColumn: date,
      AppConstance.startTimeColumn: startTime,
      AppConstance.endTimeColumn: endTime,
      AppConstance.repeatColumn: repeat,
    };
  }
}
