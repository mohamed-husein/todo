import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/global/theme/theme_color/theme_color_dark.dart';
import 'package:todo/core/global/theme/theme_color/theme_color_light.dart';
import 'package:todo/core/utils/app_constants.dart';
import 'package:todo/core/utils/app_sizes.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/services/notifications/notifications.services.dart';
import 'package:todo/view/widgets/task_tile.dart';

import '../../core/utils/custom_text.dart';
import '../../services/controller/task_controller.dart';

class ShowTasksWidget extends StatefulWidget {
  ShowTasksWidget({super.key, required this.dateTime});
  DateTime dateTime;

  @override
  State<ShowTasksWidget> createState() => _ShowTasksWidgetState();
}

class _ShowTasksWidgetState extends State<ShowTasksWidget> {
  var controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        print("build");
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.taskList.length,
          itemBuilder: (context, index) {
            TaskModel task = controller.taskList[index];
            DateTime dateTime = DateFormat.jm().parse(task.startTime);
            var myTime = DateFormat("HH:mm").format(dateTime);
            NotificationsHelper().schedulingNotifications(
              int.parse(myTime.toString().split(":")[0]),
              int.parse(myTime.toString().split(":")[1]),
              task,
            );
            if (task.repeat == "Daily") {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showButtomSheet(
                                context, controller.taskList[index]);
                          },
                          child: TaskTile(
                            controller.taskList[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (task.date == DateFormat("yMd").format(AppConstance.dateTime)) {
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showButtomSheet(
                                context, controller.taskList[index]);
                          },
                          child: TaskTile(
                            controller.taskList[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }

  showButtomSheet(BuildContext context, TaskModel task) {
    Get.bottomSheet(
      Container(
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color:
            Get.isDarkMode ? ThemeColorDark.darkGreyClr : ThemeColorLight.white,
        padding: EdgeInsets.only(
            top: AppSizes.pH6, left: AppSizes.pW16, right: AppSizes.pW16),
        child: Column(
          children: [
            Container(
              height: AppSizes.pH6,
              width: AppSizes.pW120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.br10),
                color: ThemeColorLight.grayscale,
              ),
            ),
            SizedBox(
              height: AppSizes.pH32,
            ),
            if (task.isCompleted == 0) ...[
              SizedBox(
                width: AppSizes.widthFullScreen,
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateTask(task.id!);
                    controller.printData();
                    Get.back();
                  },
                  child: CustomText.titleMedium("Task Completed",
                      context: context),
                ),
              ),
              SizedBox(
                height: AppSizes.pH8,
              ),
            ],
            SizedBox(
              width: AppSizes.widthFullScreen,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ThemeColorLight.pinkClr),
                ),
                onPressed: () {
                  controller.deleteTask(task.id!);
                  controller.printData();
                  Get.back();
                },
                child: CustomText.titleMedium("Delete Task", context: context),
              ),
            ),
            SizedBox(
              height: AppSizes.pH32,
            ),
            SizedBox(
              width: AppSizes.widthFullScreen,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: Get.isDarkMode
                      ? MaterialStateProperty.all<Color>(
                          ThemeColorLight.disableColor)
                      : MaterialStateProperty.all<Color>(ThemeColorLight.white),
                ),
                onPressed: () {
                  Get.back();
                },
                child: CustomText(
                  "Close",
                  context: context,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
