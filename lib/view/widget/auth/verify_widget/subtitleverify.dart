import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class SubTitleVerify extends StatelessWidget {
  final String text;
  final double size;

  const SubTitleVerify({super.key, required this.text, this.size = 16});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: textTheme.bodyMedium?.copyWith(
        fontSize: size,
        height: 1.6,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
