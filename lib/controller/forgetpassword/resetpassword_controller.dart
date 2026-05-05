import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/functions/handlingdata_controller.dart';
import 'package:project/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  void resetpassword();
  void goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());

  StatusRequest? statusRequest = StatusRequest.non;
  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      email = args["email"];
    }

    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  void resetpassword() {}

  @override
  void goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      Get.defaultDialog(title: "warning", middleText: "Password Not Match");
      return;
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      final response = await resetpasswordData.postdata(email!, password.text);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response is Map && response['status'] == "success") {
          Get.offNamed(AppRoute.successResetpassword);
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(
            title: "warning",
            middleText: "Unable to reset password",
          );
        }
      }

      update();
    }
  }
}
