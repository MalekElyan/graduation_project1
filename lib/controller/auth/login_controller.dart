import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/functions/handlingdata_controller.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  void login();
  void goToSignUp();
  void goToForgetPassword();
  void showPassword();
}

class LoginControllerImp extends LoginController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final LoginData loginData = LoginData(Get.find());
  final MyServices myServices = Get.find();

  late TextEditingController identifier;
  late TextEditingController password;

  StatusRequest? statusRequest = StatusRequest.non;
  bool isshowpassword = true;

  @override
  void showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  void onInit() {
    identifier = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    identifier.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void login() async {
    final formData = formstate.currentState;
    if (formData == null || !formData.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await loginData.postdata(
      identifier.text.trim(),
      password.text,
    );

    if (response is StatusRequest) {
      statusRequest = response;
      update();
      return;
    }

    if (response is! Map<String, dynamic>) {
      statusRequest = StatusRequest.serverFailure;
      update();

      Get.defaultDialog(title: "warning".tr, middleText: "Login failed");
      return;
    }

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      final String message = response["message"]?.toString() ?? "";
      final String detail = response["detail"]?.toString() ?? "";
      final String errorMessage = response["error"]?.toString() ?? "";

      final dynamic userId = response["id"] ?? response["userId"];
      final dynamic userName = response["userName"] ?? response["username"];
      final dynamic emailValue = response["email"];
      final dynamic fullName = response["fullName"] ?? response["name"];
      final dynamic token = response["token"];

      if (message.isNotEmpty) {
        if (token != null) {
          myServices.sharedPreferences.setString("token", token.toString());
        }

        if (userId != null) {
          myServices.sharedPreferences.setString("id", userId.toString());
        }

        if (userName != null) {
          myServices.sharedPreferences.setString(
            "username",
            userName.toString(),
          );
        }

        if (emailValue != null) {
          myServices.sharedPreferences.setString(
            "email",
            emailValue.toString(),
          );
        } else {
          myServices.sharedPreferences.setString(
            "email",
            identifier.text.trim(),
          );
        }

        if (fullName != null) {
          myServices.sharedPreferences.setString("name", fullName.toString());
        }

        myServices.sharedPreferences.setBool("isLogin", true);

        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest = StatusRequest.failure;
        update();

        Get.defaultDialog(
          title: "warning".tr,
          middleText: detail.isNotEmpty
              ? detail
              : errorMessage.isNotEmpty
              ? errorMessage
              : "Invalid login credentials",
        );
      }
    } else {
      Get.defaultDialog(title: "warning".tr, middleText: "Login failed");
    }

    update();
  }

  @override
  void goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
