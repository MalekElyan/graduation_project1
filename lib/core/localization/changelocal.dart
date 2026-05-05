import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/apptheme.dart';
import 'package:project/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  final MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  void changeLang(String langcode) {
    final locale = Locale(langcode);

    language = locale;
    myServices.sharedPreferences.setString("lang", langcode);

    appTheme = langcode == "ar" ? themeArabic : themeEnglish;

    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() {
    final sharedPrefLang = myServices.sharedPreferences.getString("lang");
    final deviceLang = Get.deviceLocale?.languageCode;

    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      if (deviceLang == "ar") {
        language = const Locale("ar");
        appTheme = themeArabic;
      } else {
        language = const Locale("en");
        appTheme = themeEnglish;
      }
    }

    super.onInit();
  }
}
