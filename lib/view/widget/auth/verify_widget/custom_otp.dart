import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:project/core/constant/app_colors.dart';

class CustomOTP extends StatelessWidget {
  final int numberOfFields;
  final ValueChanged<String> onSubmit;
  final ValueChanged<String>? onCodeChanged;

  const CustomOTP({
    super.key,
    this.numberOfFields = 6,
    required this.onSubmit,
    this.onCodeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OtpTextField(
        numberOfFields: numberOfFields,
        fieldWidth: 49,
        borderRadius: BorderRadius.circular(18),
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 4),
        borderColor: AppColors.borderInput,
        focusedBorderColor: AppColors.primaryGreen,
        enabledBorderColor: AppColors.borderInput,
        filled: true,
        fillColor: AppColors.backgroundCard,
        showFieldAsBox: true,
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: AppColors.primaryGreen,
        ),
        onCodeChanged: onCodeChanged ?? (_) {},
        onSubmit: onSubmit,
      ),
    );
  }
}
