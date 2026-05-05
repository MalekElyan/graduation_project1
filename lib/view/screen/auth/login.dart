import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/login_controller.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/core/functions/alertexitapp.dart';
import 'package:project/core/functions/validinput.dart';
import 'package:project/view/widget/auth/common/customtextsign.dart';
import 'package:project/view/widget/auth/login/login_header.dart';
import 'package:project/view/widget/common/actionbtn.dart';
import 'package:project/view/widget/common/textfiled.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: SafeArea(
              child: Form(
                key: controller.formstate,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    LoginHeader(
                      title: "auth_login_header_title".tr,
                      subtitle: "auth_login_header_subtitle".tr,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 22,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 12),

                          Text(
                            "auth_welcome_back".tr,
                            textAlign: TextAlign.center,
                            style: textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "auth_sign_in_description".tr,
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500,
                              height: 1.6,
                            ),
                          ),

                          const SizedBox(height: 35),

                          CustomTextfiledAuth(
                            labeltext: "auth_student_id_or_email".tr,
                            hinttext: "auth_student_id_or_email_hint".tr,
                            prefixIcon: Icons.person_outline,
                            mycontroller: controller.identifier,
                            valid: (val) {
                              if (val == null || val.trim().isEmpty) {
                                return "This field is required";
                              }

                              final value = val.trim();

                              if (value.contains("@")) {
                                if (!GetUtils.isEmail(value)) {
                                  return "Enter a valid email";
                                }
                              } else {
                                if (value.length < 3) {
                                  return "Username is too short";
                                }
                              }

                              return null;
                            },
                            textInputAction: TextInputAction.next,
                          ),

                          const SizedBox(height: 20),

                          GetBuilder<LoginControllerImp>(
                            builder: (_) => CustomTextfiledAuth(
                              labeltext: "auth_password".tr,
                              hinttext: "auth_password_hint".tr,
                              mycontroller: controller.password,
                              obscureText: controller.isshowpassword,
                              suffixIcon: controller.isshowpassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              onTapSuffixIcon: () {
                                controller.showPassword();
                              },
                              valid: (val) {
                                return validInput(val!, 3, 30, "password");
                              },
                              textInputAction: TextInputAction.done,
                            ),
                          ),

                          const SizedBox(height: 27),

                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "auth_forgot_password".tr,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  GetBuilder<LoginControllerImp>(
                                    builder: (_) => Switch(
                                      value: false,
                                      onChanged: (value) {},
                                      activeThumbColor: AppColors.white,
                                      activeTrackColor: colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    "auth_remember_me".tr,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          AuthPrimaryButton(
                            title: "auth_sign_in".tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),

                          const SizedBox(height: 35),

                          CustomTextSignUpOrSignIn(
                            textone: "auth_dont_have_account".tr,
                            texttwo: "auth_sign_up".tr,
                            onTap: () {
                              controller.goToSignUp();
                            },
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
