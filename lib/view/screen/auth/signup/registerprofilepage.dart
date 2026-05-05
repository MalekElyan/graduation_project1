import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/controllersignup.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/core/functions/validinput.dart';
import 'package:project/view/widget/auth/headersignup.dart';
import 'package:project/view/widget/common/actionbtn.dart';
import 'package:project/view/widget/common/textfiled.dart';

class RegisterProfilePageTow extends StatelessWidget {
  const RegisterProfilePageTow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: GetBuilder<ControllersignupImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: ListView(
            padding: EdgeInsets.zero,
            children: [
              Headersignup(
                title: "auth_signup_profile_header_title".tr,
                subtitle: "auth_signup_profile_header_subtitle".tr,
                currentStep: 2,
                totalSteps: 2,
                stepLabels: [
                  "auth_signup_step_basic".tr,
                  "auth_signup_step_profile".tr,
                ],
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Form(
                  key: controller.profileInfoFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextfiledAuth(
                        labeltext: "auth_specialization".tr,
                        hinttext: "auth_specialization_hint".tr,
                        mycontroller: controller.specialization,
                        valid: (val) {
                          return validInput(val!, 2, 50, "name");
                        },
                        textInputAction: TextInputAction.next,
                      ),

                      const SizedBox(height: 15),

                      CustomTextfiledAuth(
                        labeltext: "auth_work_field".tr,
                        hinttext: "auth_work_field_hint".tr,
                        mycontroller: controller.workField,
                        valid: (val) {
                          return validInput(val!, 2, 50, "name");
                        },
                        textInputAction: TextInputAction.next,
                      ),

                      const SizedBox(height: 15),

                      CustomTextfiledAuth(
                        labeltext: "auth_skills".tr,
                        hinttext: "auth_skills_hint".tr,
                        mycontroller: controller.skills,
                        valid: (val) {
                          return validInput(val!, 2, 120, "name");
                        },
                        textInputAction: TextInputAction.next,
                      ),

                      const SizedBox(height: 15),

                      _ProfileMultilineField(
                        controller: controller.description,
                        labelText: "auth_about_you".tr,
                        hintText: "auth_about_you_hint".tr,
                      ),

                      const SizedBox(height: 15),

                      CustomTextfiledAuth(
                        labeltext: "auth_github".tr,
                        hinttext: "auth_github_hint".tr,
                        mycontroller: controller.githubUrl,
                        valid: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return null;
                          }
                          if (!val.contains("github")) {
                            return "auth_github_invalid".tr;
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                      ),

                      const SizedBox(height: 15),

                      _LinkedInComingSoonCard(
                        textTheme: textTheme,
                        theme: theme,
                      ),

                      const SizedBox(height: 28),

                      AuthPrimaryButton(
                        title: "auth_create_account".tr,
                        onPressed: controller.signUp,
                      ),

                      const SizedBox(height: 24),
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
}

class _ProfileMultilineField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const _ProfileMultilineField({
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      minLines: 4,
      maxLines: 5,
      maxLength: 160,
      textInputAction: TextInputAction.newline,
      validator: (val) {
        if (val == null || val.trim().isEmpty) {
          return "validation_required".tr;
        }
        if (val.trim().length < 10) {
          return "auth_about_you_too_short".tr;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: true,
        counterStyle: theme.textTheme.bodySmall?.copyWith(
          color: AppColors.grey,
        ),
      ),
    );
  }
}

class _LinkedInComingSoonCard extends StatelessWidget {
  final TextTheme textTheme;
  final ThemeData theme;

  const _LinkedInComingSoonCard({required this.textTheme, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.backgroundCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.link_rounded,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              "auth_linkedin_coming_soon".tr,
              style: textTheme.bodyMedium?.copyWith(
                color:
                    theme.textTheme.bodyMedium?.color?.withValues(
                      alpha: 0.75,
                    ) ??
                    AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
