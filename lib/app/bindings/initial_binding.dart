import 'package:get/get.dart';
import 'package:login_firebase/app/controller/initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InitialController());
  }
}
