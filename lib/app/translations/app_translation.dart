import 'package:login_firebase/app/translations/en_US/en_us_translation.dart';
import 'package:login_firebase/app/translations/pt_PT/pt_br_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    //'pt_BR' : ptBr
    'pt_BR': ptBr,
    'en_US': enUs,
  };
}
