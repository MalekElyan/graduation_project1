import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/bindings/intialbindings.dart';
import 'package:project/cloude_page/viewandwidget/applications_page.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/localization/changelocal.dart';
import 'package:project/core/localization/translation.dart';
import 'package:project/core/services/services.dart';
import 'package:project/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Get.put(LocaleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController controller = Get.find<LocaleController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Himmah',
      translations: MyTranslation(),
      locale: controller.language,
      fallbackLocale: const Locale("en"),
      theme: controller.appTheme,
      home: const ApplicationsPage(),
      // routes: routes,
      initialRoute: AppRoute.splash,
      // getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
