import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/cloude_page/applications_controller.dart';
import 'package:project/cloude_page/viewandwidget/applications_filter_section.dart';
import 'package:project/cloude_page/viewandwidget/applications_header_section.dart';
import 'package:project/cloude_page/viewandwidget/applications_list_section.dart';
import 'package:project/cloude_page/viewandwidget/applications_stats_section.dart';
import 'package:project/core/class/handlingdataview.dart';
import 'package:project/core/constant/app_colors.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ApplicationsControllerImp());

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: GetBuilder<ApplicationsControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    ApplicationsHeaderSection(
                      title: "applications_title".tr,
                      subtitle: "applications_subtitle".tr,
                      onBack: Get.back,
                    ),

                    const SizedBox(height: 8),

                    ApplicationsStatsSection(stats: controller.stats),

                    const SizedBox(height: 4),

                    ApplicationsFilterSection(
                      activeFilter: controller.activeFilter,
                      onFilterChanged: controller.setFilter,
                    ),

                    const Divider(
                      color: AppColors.borderCard,
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                    ),

                    const SizedBox(height: 16),

                    ApplicationsListSection(
                      applications: controller.filteredApplications,
                      onAccept: controller.acceptApplication,
                      onReject: controller.rejectApplication,
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
