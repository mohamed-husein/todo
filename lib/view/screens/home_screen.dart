import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/utils/app_assets.dart';
import 'package:todo/core/utils/app_sizes.dart';
import 'package:todo/services/controller/theme_controller.dart';
import 'package:todo/services/notifications/notifications.services.dart';

import '../../services/controller/task_controller.dart';
import '../widgets/build_date_picker.dart';
import '../widgets/build_header_widget.dart';
import '../widgets/show_tasks_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(TaskController());
  @override
  void initState() {
    NotificationsHelper notificationsHelper = NotificationsHelper();
    notificationsHelper.initializeNotification();
    // Workmanager().registerPeriodicTask(DateTime.now().toString(), "background",
    //     constraints: Constraints(networkType: NetworkType.connected),
    //     initialDelay: const Duration(seconds: 1));

    super.initState();
  }

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(Icons.nightlight_outlined),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuildHeaderWidget(),
            BuildDatePicker(dateTime: dateTime),
            SizedBox(
              height: AppSizes.pH12,
            ),
            ShowTasksWidget(dateTime: dateTime),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(IconData? icon) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeController().switchTheme();
     
          NotificationsHelper()
              .displayNotifications(title: "Theme Changed", body: Get.isDarkMode?"Activated Light Mode":"Activated Dark Mode");
        },
        child: const Icon(Icons.wb_sunny_outlined),
      ),
      actions: [
        const CircleAvatar(
          backgroundImage: AssetImage(AppAssets.profile),
        ),
        SizedBox(
          width: AppSizes.pW3,
        ),
      ],
    );
  }
}
