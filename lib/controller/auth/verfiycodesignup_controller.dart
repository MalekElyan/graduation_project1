import 'dart:async';
import 'package:get/get.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/functions/handlingdata_controller.dart';
import 'package:project/data/datasource/remote/auth/resendcode.dart';
import 'package:project/data/datasource/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  void verifyCode(String verificationCode);
  void startTimer();
  void resendCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String email = "";

  Timer? timer;
  int secondsRemaining = 60;
  bool canResend = false;

  StatusRequest? statusRequest = StatusRequest.non;

  final VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(
    Get.find(),
  );
  final ResendCodeData resendCodeData = ResendCodeData(Get.find());

  String get timerText {
    final minutes = (secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      email = args["email"] ?? "";
    }

    canResend = false;
    secondsRemaining = 60;
    startTimer();
  }

  @override
  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
      } else {
        canResend = true;
        timer.cancel();
      }
      update();
    });
  }

  @override
  void resendCode() async {
    if (email.isEmpty) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await resendCodeData.postData(email);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response is Map && response['status'] == "success") {
        secondsRemaining = 60;
        canResend = false;
        startTimer();

        Get.defaultDialog(
          title: "success".tr,
          middleText: "auth_resend_success".tr,
        );
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "warning".tr,
          middleText: "auth_resend_failed".tr,
        );
      }
    }

    update();
  }

  @override
  void verifyCode(String verificationCode) async {
    if (email.isEmpty) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await verifyCodeSignupData.postdata(
      email,
      verificationCode,
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response is Map && response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "warning".tr,
          middleText: "auth_invalid_code".tr,
        );
      }
    }
    update();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
