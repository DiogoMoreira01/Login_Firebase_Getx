import 'dart:async';

import 'package:get/get.dart';
import 'package:login_firebase/app/routes/app_routes.dart';

class InitialController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loading();
  }
}

Future<Timer> loading() async {
  return await Timer(Duration(seconds: 5), () {
    Get.offAndToNamed(Routes.LOGIN);
  });
}
