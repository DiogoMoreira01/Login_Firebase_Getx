import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase/app/data/model/user_model.dart';
import 'package:login_firebase/app/data/repository/login_repository.dart';
import 'package:login_firebase/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  GetStorage box = GetStorage('Login_Firebase');

  LoginController(LoginRepository loginRepository);

  @override
  void onReady() {
    isLogged();
    super.onReady();
  }

  void isLogged() {
    if (box.hasData("auth")) {
      UserModel userModel = UserModel(
        id: box.read("auth")["id"],
        name: box.read("auth")["name"],
        email: box.read("auth")["email"],
        urlimage: box.read("auth")["urlimage"],
      );

      Get.offAllNamed(Routes.HOME, arguments: userModel);
    }
  }

  void register() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    String? userModel = (await repository.signUp(
        emailTextController.text, passwordTextController.text));

    if (userModel != null) {
      //  await box.write("auth", userModel);
      Get.offAllNamed(Routes.HOME, arguments: userModel);
    }
  }

  void login() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    UserCredential? userModel = (await repository.signIn(
        emailTextController.text, passwordTextController.text));

    if (userModel != null) {
      // await box.write("auth", userModel);
      Get.offAllNamed(Routes.HOME, arguments: userModel);
    }
  }

  void logOut() {
    repository.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
