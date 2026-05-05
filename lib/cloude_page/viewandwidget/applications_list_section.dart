import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/cloude_page/viewandwidget/application_card.dart';
import 'package:project/cloude_page/application_model.dart';
import 'package:project/core/constant/app_colors.dart';

class ApplicationsListSection extends StatelessWidget {
  final List<ApplicationModel> applications;
  final void Function(String id) onAccept;
  final void Function(String id) onReject;

  const ApplicationsListSection({
    super.key,
    required this.applications,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    if (applications.isEmpty) {
      return const _EmptyApplicationsState();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      itemCount: applications.length,
      itemBuilder: (_, index) {
        final app = applications[index];

        return ApplicationCard(
          model: app,
          onAccept: () => onAccept(app.id),
          onReject: () => onReject(app.id),
        );
      },
    );
  }
}

class _EmptyApplicationsState extends StatelessWidget {
  const _EmptyApplicationsState();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 60, 20, 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 28,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.borderCard),
        ),
        child: Column(
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 42,
              color: AppColors.primaryGreen.withValues(alpha: 0.75),
            ),
            const SizedBox(height: 12),
            Text(
              "applications_empty".tr,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
