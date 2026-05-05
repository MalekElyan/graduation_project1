import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  void next();
  void onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  final MyServices myServices = Get.find();

  int currentPage = 0;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void next() {
    if (currentPage >= onBoardingList.length - 1) {
      myServices.sharedPreferences.setBool("onBoardingDone", true);
      Get.offAllNamed(AppRoute.login);
    } else {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
