import 'package:flutter/material.dart';
import 'package:todo/core/utils/custom_text.dart';

import '../../model/task_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {super.key});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(int.parse(task.color)),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.titleMedium(
                  context: context,
                  task.title,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    CustomText(
                      context: context,
                      "${task.startTime} - ${task.endTime}",
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomText.titleSmall(
                  task.note,
                  context: context,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: CustomText.titleSmall(
              task.isCompleted == 1 ? "COMPLETED" : "TODO",
              context: context,
            ),
          ),
        ]),
      ),
    );
  }
}
