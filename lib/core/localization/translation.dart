import 'package:get/get.dart';
import 'package:project/core/localization/arTranslations.dart';
import 'package:project/core/localization/enTranslations.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": arTranslations,
    "en": enTranslations,
  };
}
