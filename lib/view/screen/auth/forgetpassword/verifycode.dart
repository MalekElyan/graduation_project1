import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:project/controller/forgetpassword/verifycode_controller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/view/widget/auth/common/customtextbodyauth.dart';
import 'package:project/view/widget/auth/common/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "auth_verification_code_title".tr,
          style: textTheme.headlineLarge?.copyWith(color: AppColors.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            child: ListView(
              children: [
                const SizedBox(height: 20),

                CustomTextTitleAuth(text: "auth_check_code".tr),

                const SizedBox(height: 10),

                CustomTextBodyAuth(text: "auth_verify_code_message".tr),

                const SizedBox(height: 20),

                OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: AppColors.primaryGreen,
                  showFieldAsBox: true,
                  focusedBorderColor: AppColors.primaryGreen,
                  enabledBorderColor: AppColors.borderCard,
                  textStyle: textTheme.headlineSmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.goToResetPassword(verificationCode);
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
