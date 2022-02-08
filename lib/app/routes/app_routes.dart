// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_firebase/app/bindings/home_bindings.dart';
import 'package:login_firebase/app/bindings/login_binding.dart';
import 'package:login_firebase/app/ui/android/home_page.dart';
import 'package:login_firebase/app/ui/android/initial_page.dart';
import 'package:login_firebase/app/ui/android/login_page.dart';
import 'package:login_firebase/app/ui/android/register_page.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const REGISTER = '/register';
}

class AppPages {
  static final routes = [
    // ignore: null_check_always_fails
    GetPage(name: Routes.INITIAL, page: () => InitialPage()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
    ),
  ];
}
//importa pra mim,
