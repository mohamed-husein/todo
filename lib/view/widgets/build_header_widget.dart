import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/app_sizes.dart';
import 'package:todo/core/utils/custom_text.dart';
import 'package:todo/view/screens/add_task_screen.dart';

import '../../services/controller/task_controller.dart';

class BuildHeaderWidget extends StatelessWidget {
  const BuildHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat("yMMMMd").format(DateTime.now());
    var controller = Get.put(TaskController());
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.pH12, horizontal: AppSizes.pW16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.labelLarge(
                date,
                context: context,
              ),
              SizedBox(
                height: AppSizes.pH6,
              ),
              CustomText.bodyMedium(
                "Today",
                context: context,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              await Get.to(() => const AddTaskScreen());
            },
            child: CustomText.titleMedium("+ Add Task", context: context),
          ),
        ],
      ),
    );
  }
}
