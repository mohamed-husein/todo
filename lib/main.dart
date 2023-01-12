import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/services/controller/theme_controller.dart';
import 'package:todo/core/global/theme/theme_data/dark.dart';
import 'package:todo/core/global/theme/theme_data/light.dart';
import 'package:todo/view/screens/home_screen.dart';

// const taskName = "firstTask";
// int count = 0;
// void callbackDispatcher() {
//   Workmanager().executeTask((taskName, inputData) {

//           NotificationsHelper().display(body: "", title: "");

//     return Future.value(true);
//   });
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: false,
      builder: (__, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Todo',
        theme: getThemeDataLight,
        darkTheme: getThemeDataDark,
        themeMode: ThemeController().themeMode,
        home: const HomeScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
      ),
    );
  }
}
