import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class SkillChip extends StatelessWidget {
  final String title;
  final bool compact;

  const SkillChip({super.key, required this.title, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: compact ? 12 : 20,
        vertical: compact ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.badgeDoneBackground,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.badgeDoneBorder),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryGreen,
          fontSize: compact ? 13 : 15,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
