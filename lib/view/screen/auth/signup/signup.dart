import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/controllersignup.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/core/functions/validinput.dart';
import 'package:project/view/widget/auth/headersignup.dart';
import 'package:project/view/widget/auth/imageuploder.dart';
import 'package:project/view/widget/common/actionbtn.dart';
import 'package:project/view/widget/common/textfiled.dart';

class RegisterPageOne extends StatelessWidget {
  const RegisterPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllersignupImp());

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: GetBuilder<ControllersignupImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: ListView(
            padding: EdgeInsets.zero,
            children: [
              Headersignup(
                title: "auth_signup_header_title".tr,
                subtitle: "auth_signup_header_subtitle".tr,
                currentStep: 1,
                totalSteps: 2,
                stepLabels: [
                  "auth_signup_step_basic".tr,
                  "auth_signup_step_verify".tr,
                ],
              ),
              const SizedBox(height: 20),

              ImageUploader(
                placeholderIcon: Icons.person,
                pickFromCamera: true,
                onImagePicked: controller.setProfileImage,
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Form(
                  key: controller.basicInfoFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextfiledAuth(
                        labeltext: "auth_full_name".tr,
                        hinttext: "auth_full_name_hint".tr,
                        mycontroller: controller.fullName,
                        valid: (val) {
                          return validInput(val!, 3, 50, "name");
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),

                      CustomTextfiledAuth(
                        labeltext: "auth_username".tr,
                        hinttext: "auth_username_hint".tr,
                        mycontroller: controller.username,
                        valid: (val) {
                          return validInput(val!, 3, 30, "username");
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),

                      CustomTextfiledAuth(
                        labeltext: "auth_email".tr,
                        hinttext: "auth_email_hint".tr,
                        mycontroller: controller.email,
                        valid: (val) {
                          if (val == null || val.isEmpty) {
                            return "validation_email_required".tr;
                          }
                          if (!val.contains("@")) {
                            return "validation_invalid_email".tr;
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),

                      // _buildRoleDropdown(
                      //   context: context,
                      //   controller: controller,
                      //   colorScheme: colorScheme,
                      // ),
                      const SizedBox(height: 15),

                      CustomTextfiledAuth(
                        labeltext: "auth_password".tr,
                        hinttext: "auth_password_hint".tr,
                        mycontroller: controller.password,
                        obscureText: true,
                        suffixIcon: Icons.lock_outline,
                        valid: (val) {
                          return validInput(val!, 3, 30, "password");
                        },
                        textInputAction: TextInputAction.done,
                      ),

                      const SizedBox(height: 20),

                      AuthPrimaryButton(
                        title: "common_next".tr,
                        onPressed: controller.goToProfileStep,
                      ),

                      const SizedBox(height: 24),

                      Text(
                        "auth_sign_up_helper_text".tr,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color:
                              theme.textTheme.bodyMedium?.color?.withOpacity(
                                0.7,
                              ) ??
                              AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //   Widget _buildRoleDropdown({
  //     required BuildContext context,
  //     required ControllersignupImp controller,
  //     required ColorScheme colorScheme,
  //   }) {
  //     final theme = Theme.of(context);

  //     return Padding(
  //       padding: const EdgeInsetsDirectional.only(bottom: 12),
  //       child: DropdownButtonFormField<bool>(
  //         value: controller.role,
  //         dropdownColor: theme.cardColor,
  //         style: theme.textTheme.bodyMedium?.copyWith(
  //           color: AppColors.textPrimary,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         decoration: InputDecoration(labelText: "auth_account_type".tr),
  //         iconEnabledColor: colorScheme.primary,
  //         items: [
  //           DropdownMenuItem<bool>(
  //             value: false,
  //             child: Text("auth_account_type_user".tr),
  //           ),
  //           DropdownMenuItem<bool>(
  //             value: true,
  //             child: Text("auth_account_type_provider".tr),
  //           ),
  //         ],
  //         onChanged: (value) {
  //           if (value != null) {
  //             controller.setRole(value);
  //           }
  //         },
  //       ),
  //     );
  //   }
  // }
}
