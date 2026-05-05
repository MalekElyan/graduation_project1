import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/data/datasource/remote/auth/signup.dart';

abstract class Controllersignup extends GetxController {
  void goToProfileStep();
  void signUp();
  void goToLogin();
  void setProfileImage(XFile? image);
}

class ControllersignupImp extends Controllersignup {
  final GlobalKey<FormState> basicInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> profileInfoFormKey = GlobalKey<FormState>();

  final SignupData signupData = SignupData(Get.find());

  late TextEditingController fullName;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController skills;
  late TextEditingController githubUrl;
  late TextEditingController workField;
  late TextEditingController specialization;
  late TextEditingController description;

  XFile? profileImage;

  // بما أنك لا تريدين تمرير Role من الواجهة
  // نخليه قيمة ثابتة افتراضيًا
  bool role = false;

  StatusRequest? statusRequest = StatusRequest.non;

  @override
  void onInit() {
    fullName = TextEditingController();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    skills = TextEditingController();
    githubUrl = TextEditingController();
    workField = TextEditingController();
    specialization = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullName.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
    skills.dispose();
    githubUrl.dispose();
    workField.dispose();
    specialization.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  void setProfileImage(XFile? image) {
    profileImage = image;
    update();
  }

  @override
  void goToProfileStep() {
    final formData = basicInfoFormKey.currentState;
    if (formData == null || !formData.validate()) return;

    Get.toNamed(AppRoute.RegisterProfilePageTow);
  }

  @override
  void signUp() async {
    final formData = profileInfoFormKey.currentState;
    if (formData == null || !formData.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await signupData.postdata(
      fullName: fullName.text.trim(),
      email: email.text.trim(),
      userName: username.text.trim(),
      password: password.text,
      profileImage: profileImage,
      skills: skills.text.trim(),
      githubUrl: githubUrl.text.trim(),
      workField: workField.text.trim(),
      specialization: specialization.text.trim(),
      description: description.text.trim(),
      role: role,
    );

    // إذا رجع من datasource خطأ من نوع StatusRequest
    if (response is StatusRequest) {
      statusRequest = response;
      update();
      return;
    }

    // إذا رجع response غير متوقع
    if (response is! Map<String, dynamic>) {
      statusRequest = StatusRequest.serverFailure;
      update();

      Get.defaultDialog(
        title: "warning".tr,
        middleText: "auth_signup_failed".tr,
      );
      return;
    }

    // هنا الطلب وصل ورجع Response من السيرفر
    statusRequest = StatusRequest.success;
    update();

    final String message = response["message"]?.toString() ?? "";
    final String detail = response["detail"]?.toString() ?? "";
    final String errorMessage = response["error"]?.toString() ?? "";

    // نجاح فعلي من الباك إند
    if (message.isNotEmpty) {
      Get.defaultDialog(
        title: "auth_signup_success_title".tr,
        middleText: "auth_email_confirmation_required".tr,
        textConfirm: "common_ok".tr,
        onConfirm: () {
          Get.back();
          Get.offAllNamed(AppRoute.login);
        },
      );
      return;
    }

    // إذا رجع خطأ واضح من الباك إند
    statusRequest = StatusRequest.failure;
    update();

    Get.defaultDialog(
      title: "warning".tr,
      middleText: detail.isNotEmpty
          ? detail
          : errorMessage.isNotEmpty
          ? errorMessage
          : "auth_signup_failed".tr,
    );
  }

  @override
  void goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
