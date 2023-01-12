import 'package:get/get.dart';
import 'package:todo/model/task_model.dart';
import '../database/database_helper.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    printData();
    super.onInit();
  }



  Future<int> addTask(TaskModel taskModel) async {
    return await DatabaseHelper().insertTask(taskModel);
  }

  var taskList = <TaskModel>[].obs;
  void printData() async {
    var data = await DatabaseHelper().getAllTasks();
    taskList.assignAll(data.map((e) => TaskModel.fromJson(e)).toList());
  }

  Future<void> deleteTask(int id) async {
    await DatabaseHelper().deleteTask(id);
  }

  Future<void> updateTask(int id) async {
    await DatabaseHelper().updateTask(id);
  }
}
