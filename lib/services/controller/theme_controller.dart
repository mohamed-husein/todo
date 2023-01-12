import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/core/utils/app_constants.dart';

class ThemeController extends GetxController {
  final GetStorage _box = GetStorage();

  var icon =  Icons.wb_sunny_outlined.obs;
  bool getSavedTheme() {
    return _box.read<bool>(AppConstance.themeKey) ?? false;
  }

  saveTheme(bool theme) async {
    await _box.write(AppConstance.themeKey, theme);
  }

  ThemeMode get themeMode => getSavedTheme() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(getSavedTheme() ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!getSavedTheme());
    
  }
}
