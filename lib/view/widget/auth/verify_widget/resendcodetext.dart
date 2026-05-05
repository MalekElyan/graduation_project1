import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/verfiycodesignup_controller.dart';
import 'package:project/core/constant/app_colors.dart';

class ResendCodeText extends StatelessWidget {
  final String prefixText;
  final String actionText;

  const ResendCodeText({
    super.key,
    required this.prefixText,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<VerifyCodeSignUpControllerImp>(
      builder: (controller) {
        return TextButton(
          onPressed: controller.canResend ? controller.resendCode : null,
          child: Text.rich(
            TextSpan(
              text: prefixText,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: actionText,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: controller.canResend
                        ? AppColors.primaryGreen
                        : AppColors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
