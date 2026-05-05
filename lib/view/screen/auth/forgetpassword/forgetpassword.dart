import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/core/functions/validinput.dart';
import 'package:project/view/widget/auth/common/customtextbodyauth.dart';
import 'package:project/view/widget/auth/common/customtexttitleauth.dart';
import 'package:project/view/widget/common/actionbtn.dart';
import 'package:project/view/widget/common/textfiled.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "auth_forgot_password".tr,
          style: textTheme.headlineLarge?.copyWith(color: AppColors.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),

                  CustomTextTitleAuth(text: "auth_check_email".tr),

                  const SizedBox(height: 10),

                  CustomTextBodyAuth(text: "auth_verify_email_message".tr),

                  const SizedBox(height: 20),

                  CustomTextfiledAuth(
                    labeltext: "auth_email".tr,
                    hinttext: "auth_email_hint".tr,
                    prefixIcon: Icons.email_outlined,
                    mycontroller: controller.email,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    textInputAction: TextInputAction.done,
                  ),

                  const SizedBox(height: 20),

                  AuthPrimaryButton(
                    title: "common_check".tr,
                    onPressed: () {
                      controller.checkEmail();
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
