import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/successresetpassword_controller.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/view/widget/common/actionbtn.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessResetPasswordControllerImp controller = Get.put(
      SuccessResetPasswordControllerImp(),
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 3),

                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffF4FBF6),
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
                    child: Icon(
                      Icons.check_circle_rounded,
                      size: 110,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                Text(
                  "common_congratulations".tr,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "auth_reset_password_successfully".tr,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                    height: 1.6,
                  ),
                ),

                const Spacer(flex: 1),

                AuthPrimaryButton(
                  title: "common_go_to_login".tr,
                  onPressed: () {
                    controller.goToPageLogin();
                  },
                ),

                const Spacer(flex: 2),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
