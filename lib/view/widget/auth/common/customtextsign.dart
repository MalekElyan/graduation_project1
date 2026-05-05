import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final VoidCallback onTap;

  const CustomTextSignUpOrSignIn({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
