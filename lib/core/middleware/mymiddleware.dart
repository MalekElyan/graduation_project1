import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  final MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final bool onBoardingDone =
        myServices.sharedPreferences.getBool("onBoardingDone") ?? false;

    if (onBoardingDone) {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
