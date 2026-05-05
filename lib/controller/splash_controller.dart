import 'dart:async';
import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/services/services.dart';

abstract class SplashController extends GetxController {
  void goNext();
}

class SplashControllerImp extends SplashController {
  final MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 4), goNext);
  }

  @override
  void goNext() {
    final bool onBoardingDone =
        myServices.sharedPreferences.getBool("onBoardingDone") ?? false;

    final bool isLogin =
        myServices.sharedPreferences.getBool("isLogin") ?? false;

    if (isLogin) {
      Get.offAllNamed(AppRoute.main);
    } else if (onBoardingDone) {
      Get.offAllNamed(AppRoute.login);
    } else {
      Get.offAllNamed(AppRoute.language);
    }
  }
}
