import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:login_firebase/app/routes/app_routes.dart';
import 'package:page_transition/page_transition.dart';

class InitialPage extends GetView<InitialPage> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Image.asset('imagens/fogo.png'),
      screenFunction: () => Get.offNamed(Routes.LOGIN) as Future<Widget>,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightJoined,
    );
  }
}
