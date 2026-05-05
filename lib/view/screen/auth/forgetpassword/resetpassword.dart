import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/forgetpassword/resetpassword_controller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/core/functions/validinput.dart';
import 'package:project/view/widget/auth/common/customtextbodyauth.dart';
import 'package:project/view/widget/auth/common/customtexttitleauth.dart';
import 'package:project/view/widget/common/actionbtn.dart';
import 'package:project/view/widget/common/textfiled.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "auth_reset_password_title".tr,
          style: textTheme.headlineLarge?.copyWith(color: AppColors.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
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

                  CustomTextTitleAuth(text: "auth_new_password".tr),

                  const SizedBox(height: 10),

                  CustomTextBodyAuth(
                    text: "auth_reset_password_description".tr,
                  ),

                  const SizedBox(height: 20),

                  CustomTextfiledAuth(
                    labeltext: "auth_password".tr,
                    hinttext: "auth_password_hint".tr,
                    mycontroller: controller.password,
                    obscureText: true,
                    suffixIcon: Icons.lock_outline,
                    valid: (val) {
                      return validInput(val!, 3, 40, "password");
                    },
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 15),

                  CustomTextfiledAuth(
                    labeltext: "auth_confirm_password".tr,
                    hinttext: "auth_confirm_password_hint".tr,
                    mycontroller: controller.repassword,
                    obscureText: true,
                    suffixIcon: Icons.lock_outline,
                    valid: (val) {
                      return validInput(val!, 3, 40, "password");
                    },
                    textInputAction: TextInputAction.done,
                  ),

                  const SizedBox(height: 20),

                  AuthPrimaryButton(
                    title: "common_save".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
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
