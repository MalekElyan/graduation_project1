import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/view/widget/common/appcircle_icon_btn.dart';

class ApplicationsHeaderSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBack;

  const ApplicationsHeaderSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppCircleIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  iconSize: 18,
                  backgroundColor: AppColors.backgroundCard,
                  borderColor: AppColors.borderCard,
                  iconColor: AppColors.primaryGreen,
                  onTap: onBack,
                ),
                const SizedBox(width: 8),
                Text(
                  "common_back".tr,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
