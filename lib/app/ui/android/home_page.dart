// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/app/controller/home_controller.dart';
import 'package:login_firebase/app/controller/login_controller.dart';
import 'package:login_firebase/app/data/repository/login_repository.dart';
import 'package:login_firebase/app/ui/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double _widght = size.width;
    double _height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("title_home_page".tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _body(_widght, _height),
      ),
    );
  }

  Stack _body(double _widght, double _height) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _widght * 0.47,
              height: _height * 0.28,
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                image: DecorationImage(
                  image: NetworkImage(_homeController
                          .userModel.user?.photoURL ??
                      'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(75.0)),
                boxShadow: const [
                  BoxShadow(blurRadius: 7.0, color: Colors.black)
                ],
              ),
            ),
            SizedBox(height: _height * 0.01),
            Text(
              _homeController.userModel.user?.email ?? "",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: _height * 0.015),
            Text(
              '${_homeController.userModel.user?.email}',
              style: const TextStyle(
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: _height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: _height * 0.055,
                  width: _widght * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appThemeData.primaryColor,
                    ),
                    onPressed: () {
                      print("Idioma: Português");
                      Get.updateLocale(Locale('pt', 'BR'));
                    },
                    child: const Center(
                      child: Text(
                        'pt_BR',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * 0.055,
                  width: _widght * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appThemeData.primaryColor,
                    ),
                    onPressed: () {
                      print("Idioma: Inglês");
                      Get.updateLocale(Locale('en', 'US'));
                    },
                    child: const Center(
                      child: Text(
                        'en_US',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: _height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: _height * 0.055,
                  width: _widght * 0.45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appThemeData.primaryColor,
                      side: BorderSide(
                          //width: 2.0,
                          color: appThemeData.colorScheme.secondary),
                    ),
                    onPressed: () {
                      print("Tema: Claro");
                      _homeController.changeTheme();
                    },
                    child: Center(
                      child: Text(
                        //"${_homeController.txtthemeButton.value}".tr,
                        "tema_home_page".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: _height * 0.025),
            SizedBox(
              height: _height * 0.055,
              width: _widght * 0.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  print("Sair");
                  LoginController(LoginRepository()).logOut();
                },
                child: Center(
                  child: Text(
                    'sair_home_page'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
