import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/successsignup_controller.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/view/widget/auth/verify_widget/customcheak_icon.dart';
import 'package:project/view/widget/auth/verify_widget/subtitleverify.dart';
import 'package:project/view/widget/common/actionbtn.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessSignUpControllerImp controller = Get.put(
      SuccessSignUpControllerImp(),
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 3),
              const _SuccessCircle(),
              const SizedBox(height: 35),
              Text(
                "auth_registered_successfully".tr,
                textAlign: TextAlign.center,
                style: textTheme.headlineLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              SubTitleVerify(text: "auth_success_signup_subtitle".tr, size: 16),
              const Spacer(flex: 1),
              AuthPrimaryButton(
                title: "common_next".tr,
                onPressed: controller.goToPageLogin,
              ),
              const Spacer(flex: 2),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuccessCircle extends StatelessWidget {
  const _SuccessCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryGreenSoft,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withValues(alpha: 0.08),
            blurRadius: 30,
            spreadRadius: 4,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Center(
        child: CustomIcon(
          icon: Icons.check_circle_rounded,
          size: 80,
          containerSize: 96,
        ),
      ),
    );
  }
}
