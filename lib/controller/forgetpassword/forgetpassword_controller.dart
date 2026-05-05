import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/functions/handlingdata_controller.dart';
import 'package:project/data/datasource/remote/forgetpassword/cheackemail.dart';

abstract class ForgetPasswordController extends GetxController {
  void checkEmail();
  void goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  final CheackEmailData cheackEmailData = CheackEmailData(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.non;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  void checkEmail() async {
    final formData = formstate.currentState;
    if (formData == null || !formData.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await cheackEmailData.postdata(email.text);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response is Map && response['status'] == "success") {
        Get.offNamed(AppRoute.verfiyCode, arguments: {"email": email.text});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "warning".tr,
          middleText: "auth_email_not_found".tr,
        );
      }
    }

    update();
  }

  @override
  void goToVerifyCode() {
    Get.offNamed(AppRoute.verfiyCode, arguments: {"email": email.text});
  }
}
