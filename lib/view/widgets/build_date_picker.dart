import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/global/theme/theme_color/theme_color_light.dart';
import 'package:todo/core/utils/app_constants.dart';
import 'package:todo/core/utils/app_sizes.dart';
import 'package:todo/services/controller/task_controller.dart';

class BuildDatePicker extends StatefulWidget {
  BuildDatePicker({super.key, required this.dateTime});
  DateTime dateTime;

  @override
  State<BuildDatePicker> createState() => _BuildDatePickerState();
}

class _BuildDatePickerState extends State<BuildDatePicker> {
  DateTime dateTime = DateTime.now();
  var controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppSizes.pW16, bottom: AppSizes.pH12),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        height: AppSizes.pH100,
        width: AppSizes.pW75,
        selectionColor: ThemeColorLight.primaryClr,
        selectedTextColor: ThemeColorLight.white,
        dateTextStyle: Theme.of(context).textTheme.labelLarge!,
        monthTextStyle: Theme.of(context).textTheme.labelSmall!,
        dayTextStyle: Theme.of(context).textTheme.labelMedium!,
        onDateChange: (selectedDate) {
          setState(() {
            AppConstance.dateTime = selectedDate;
          });
          controller.printData();
        },
        daysCount: 30,
      ),
    );
  }
}
