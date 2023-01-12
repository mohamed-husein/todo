import 'package:todo/services/controller/theme_controller.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundServices {
  static const String taskName = "firstTask";
  void callDispatch() {
    Workmanager().executeTask((taskName, inputData) {
     
          ThemeController().switchTheme();
 
      return Future.value(true);
    });
  }
}
