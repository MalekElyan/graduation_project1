import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class InfoBox extends StatelessWidget {
  final String text;
  final IconData icon;

  const InfoBox({
    super.key,
    required this.text,
    this.icon = Icons.info_outline_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.warningBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.warningBorder, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.warningIcon, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyMedium?.copyWith(
                height: 1.7,
                color: AppColors.warningText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
