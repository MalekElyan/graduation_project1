import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/cloude_page/application_model.dart';
import 'package:project/view/widget/main/homewidget/category_chip.dart';

class ApplicationsFilterSection extends StatelessWidget {
  final ApplicationStatus? activeFilter;
  final ValueChanged<ApplicationStatus?> onFilterChanged;

  const ApplicationsFilterSection({
    super.key,
    required this.activeFilter,
    required this.onFilterChanged,
  });

  static final List<_ApplicationFilterItem> _tabs = [
    _ApplicationFilterItem(label: "common_all".tr, value: null),
    _ApplicationFilterItem(
      label: "status_pending".tr,
      value: ApplicationStatus.pending,
    ),
    _ApplicationFilterItem(
      label: "status_accepted".tr,
      value: ApplicationStatus.accepted,
    ),
    _ApplicationFilterItem(
      label: "status_rejected".tr,
      value: ApplicationStatus.rejected,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: Get.locale?.languageCode == 'ar',
        child: Row(
          children: _tabs.map((tab) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: HomeCategoryChip(
                label: tab.label,
                isSelected: activeFilter == tab.value,
                onTap: () => onFilterChanged(tab.value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ApplicationFilterItem {
  final String label;
  final ApplicationStatus? value;

  const _ApplicationFilterItem({required this.label, required this.value});
}
