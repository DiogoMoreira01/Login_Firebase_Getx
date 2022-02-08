import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_firebase/app/routes/app_routes.dart';
import 'package:login_firebase/app/translations/app_translation.dart';
import 'package:login_firebase/app/ui/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await GetStorage.init('Login_Firebase');
  GetStorage box = GetStorage('Login_Firebase');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    title: 'Login Firebase',
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes, //setar aquirvos de rota
    initialRoute: Routes.INITIAL,

    theme:
        // ignore: unrelated_type_equality_checks
        box.write("theme", "dark") == "dark" ? ThemeData.dark() : ThemeData(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    locale: Locale('pt', 'BR'),
    translationsKeys: AppTranslation.translations,
  ));
}
