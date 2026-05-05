import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class AuthPrimaryButton extends StatelessWidget {
  final String title;
  final bool isFilled;
  final VoidCallback? onPressed;
  final double height;
  final double borderRadius;

  const AuthPrimaryButton({
    super.key,
    required this.title,
    this.isFilled = true,
    this.onPressed,
    this.height = 56,
    this.borderRadius = 22,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isFilled
              ? AppColors.primaryGreen
              : AppColors.backgroundCard,
          foregroundColor: isFilled ? AppColors.white : AppColors.primaryGreen,
          side: BorderSide(
            color: isFilled
                ? AppColors.primaryGreen
                : AppColors.badgeDoneBorder,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
