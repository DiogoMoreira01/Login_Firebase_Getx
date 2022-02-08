import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase/app/ui/theme/app_theme.dart';

class HomeController extends GetxController {
  final UserCredential userModel = Get.arguments;
  GetStorage box = GetStorage('Login_Firebase');

  RxString txtthemeButton = "tema_escuro_home_page".obs;

  @override
  void onInit() {
    txtthemeButton = Get.isDarkMode
        ? "tema_claro_home_page".obs
        : "tema_escuro_home_page".obs;
    super.onInit();
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      box.write("theme", "light");
      txtthemeButton = "tema_claro_home_page".obs;
      Get.changeTheme(ThemeData.light());
    } else {
      box.write("theme", "dark");
      txtthemeButton = "tema_escuro_home_page".obs;
      Get.changeTheme(ThemeData.dark());
    }
  }
}
