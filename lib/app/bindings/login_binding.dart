import 'package:get/get.dart';
import 'package:login_firebase/app/controller/login_controller.dart';
import 'package:login_firebase/app/data/repository/login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(LoginRepository()));
  }
}
