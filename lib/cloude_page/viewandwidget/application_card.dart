import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/cloude_page/application_model.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/view/widget/common/actionbtn.dart';
import 'package:project/view/widget/profile/skill_chip.dart';

class ApplicationCard extends StatelessWidget {
  final ApplicationModel model;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const ApplicationCard({
    super.key,
    required this.model,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderCard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StatusBadge(status: model.status),
              const Spacer(),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      model.name,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      model.field,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${model.rating}',
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 13,
                            color: AppColors.accentGold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.accentGold,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _Avatar(name: model.name),
            ],
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.end,
            children: model.skills
                .map((skill) => SkillChip(title: skill, compact: true))
                .toList(),
          ),

          if (model.status == ApplicationStatus.pending) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: AuthPrimaryButton(
                    title: "common_reject".tr,
                    isFilled: false,
                    height: 44,
                    borderRadius: 14,
                    onPressed: onReject,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: AuthPrimaryButton(
                    title: "applications_accept_request".tr,
                    height: 44,
                    borderRadius: 14,
                    onPressed: onAccept,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String name;

  const _Avatar({required this.name});

  @override
  Widget build(BuildContext context) {
    final firstLetter = name.trim().isNotEmpty
        ? name.trim().characters.first
        : "?";

    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.avatarBackground,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.avatarOutline, width: 2),
      ),
      alignment: Alignment.center,
      child: Text(
        firstLetter,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final ApplicationStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final badge = _badgeStyle(status);

    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: badge.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badge.borderColor),
      ),
      child: Text(
        badge.label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: badge.textColor,
        ),
      ),
    );
  }

  _ApplicationBadgeStyle _badgeStyle(ApplicationStatus status) {
    switch (status) {
      case ApplicationStatus.pending:
        return _ApplicationBadgeStyle(
          label: "status_pending".tr,
          backgroundColor: AppColors.statePendingBackground,
          textColor: AppColors.statePendingText,
          borderColor: AppColors.warningBorder,
        );

      case ApplicationStatus.accepted:
        return _ApplicationBadgeStyle(
          label: "status_accepted".tr,
          backgroundColor: AppColors.stateAcceptedBackground,
          textColor: AppColors.stateAcceptedText,
          borderColor: AppColors.badgeDoneBorder,
        );

      case ApplicationStatus.rejected:
        return _ApplicationBadgeStyle(
          label: "status_rejected".tr,
          backgroundColor: AppColors.stateRejectedBackground,
          textColor: AppColors.colorRed,
          borderColor: AppColors.colorRed,
        );
    }
  }
}

class _ApplicationBadgeStyle {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const _ApplicationBadgeStyle({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
  });
}
