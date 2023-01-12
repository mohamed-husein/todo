import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/global/theme/theme_color/theme_color_light.dart';
import 'package:todo/services/controller/task_controller.dart';
import 'package:todo/services/notifications/notifications.services.dart';

import '../../core/app_component/custom_text_field.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_constants.dart';
import '../../core/utils/app_sizes.dart';
import '../../core/utils/custom_text.dart';
import '../../model/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String _startTime = DateFormat("hh:mm a").format(DateTime.now());
  String _endTime = "11:30 PM";
  int _selectedRemind = 5;
  final List<int> remindList = [5, 10, 15, 20];

  String _selectRepeat = "None";
  final List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final List<Color> colors = [
    ThemeColorLight.primaryClr,
    ThemeColorLight.pinkClr,
    ThemeColorLight.yellowClr
  ];

  int selectedIndex = 0;

  var controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage(AppAssets.profile),
          ),
          SizedBox(
            width: AppSizes.pW3,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pW16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.bodyMedium(
                "Add Task",
                context: context,
              ),
              CustomTextField(
                title: "Title",
                hint: "Enter title here",
                controller: titleController,
              ),
              CustomTextField(
                title: "Note",
                hint: "Enter note here",
                controller: noteController,
              ),
              CustomTextField(
                title: "Date",
                hint: AppConstance.selectedDate,
                isSelect: true,
                widget: IconButton(
                    onPressed: () {
                      _getDateFromUser();
                    },
                    icon: const Icon(Icons.calendar_today_outlined)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppSizes.widthFullScreen / 2.25.w,
                    child: CustomTextField(
                      title: "Start Time",
                      isSelect: true,
                      hint: _startTime,
                      widget: IconButton(
                          onPressed: () {
                            _getTimeFromTheUser(isStartTime: true);
                          },
                          icon: const Icon(Icons.access_time_rounded)),
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.widthFullScreen / 2.25.w,
                    child: CustomTextField(
                      title: "End Time",
                      isSelect: true,
                      hint: _endTime,
                      widget: IconButton(
                          onPressed: () {
                            _getTimeFromTheUser(isStartTime: false);
                          },
                          icon: const Icon(Icons.access_time_rounded)),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                title: "Remind",
                hint: "$_selectedRemind minutes early",
                isSelect: true,
                widget: DropdownButton(
                  items: remindList
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem(
                                value: value.toString(),
                                child: CustomText.bodySmall(
                                  value.toString(),
                                  context: context,
                                ),
                              ))
                      .toList(),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedRemind = int.parse(value!);
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
              CustomTextField(
                title: "Repeat",
                hint: _selectRepeat,
                isSelect: true,
                widget: DropdownButton(
                  items: repeatList
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem(
                                value: value,
                                child: CustomText.bodySmall(
                                  value,
                                  context: context,
                                ),
                              ))
                      .toList(),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectRepeat = value!;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
              SizedBox(
                height: AppSizes.pH8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.bodySmall(
                        "Color",
                        context: context,
                      ),
                      SizedBox(
                        height: AppSizes.pH6,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: List.generate(
                            colors.length,
                            (index) => Padding(
                                  padding: EdgeInsets.only(right: AppSizes.pW2),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: AppSizes.br15,
                                      backgroundColor: colors[index],
                                      child: selectedIndex == index
                                          ? const Icon(
                                              Icons.check,
                                              color: ThemeColorLight.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                )),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _validate();
                    },
                    child:
                        CustomText.titleMedium("+ Add Task", context: context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validate() async {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      await controller.addTask(TaskModel(
        isCompleted: 0,
        color: colors[selectedIndex].value.toString(),
        remind: _selectedRemind,
        title: titleController.text,
        note: noteController.text,
        date: AppConstance.selectedDate,
        startTime: _startTime,
        endTime: _endTime,
        repeat: _selectRepeat,
      ));
      controller.printData();
      // DateTime dateTime = DateFormat.jm().parse(_startTime);
      // var myTime = DateFormat("HH:mm").format(dateTime);
      // NotificationsHelper().schedulingNotifications(
      //   int.parse(myTime.toString().split(":")[0]),
      //   int.parse(myTime.toString().split(":")[1]),
      //   TaskModel(
      //     isCompleted: 0,
      //     color: colors[selectedIndex].value.toString(),
      //     remind: _selectedRemind,
      //     title: titleController.text,
      //     note: noteController.text,
      //     date: AppConstance.selectedDate,
      //     startTime: _startTime,
      //     endTime: _endTime,
      //     repeat: _selectRepeat,
      //   ),
      // );
      // NotificationsHelper().schedulingNotifications();
      Get.back();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required",
        colorText: ThemeColorLight.pinkClr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _getDateFromUser() async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (datePicker != null) {
      setState(() {
        AppConstance.selectedDate = DateFormat("yMd").format(datePicker);
      });
    }
  }

  _getTimeFromTheUser({required bool isStartTime}) async {
    var timePicker = await _showTimePicker();
    String formatedTime = timePicker.format(context);
    if (timePicker == null) {
      debugPrint("");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
