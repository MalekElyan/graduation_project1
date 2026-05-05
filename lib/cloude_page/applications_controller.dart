import 'package:get/get.dart';
import 'package:project/cloude_page/application_model.dart';
import 'package:project/cloude_page/application_stat_model.dart';
import 'package:project/cloude_page/applications_data.dart';
import 'package:project/core/class/stutusrequest.dart';

abstract class ApplicationsController extends GetxController {
  void getApplications();
  void setFilter(ApplicationStatus? status);
  void acceptApplication(String id);
  void rejectApplication(String id);
}

class ApplicationsControllerImp extends ApplicationsController {
  StatusRequest? statusRequest = StatusRequest.non;

  ApplicationStatus? activeFilter;

  List<ApplicationModel> applications = [];
  List<ApplicationModel> filteredApplications = [];

  @override
  void onInit() {
    getApplications();
    super.onInit();
  }

  @override
  void getApplications() async {
    statusRequest = StatusRequest.loading;
    update();

    // مؤقتًا من static data
    // لاحقًا هون بنستبدلها بطلب API من الداتا بيس
    applications = List<ApplicationModel>.from(ApplicationsData.applications);

    _applyFilter();

    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void setFilter(ApplicationStatus? status) {
    activeFilter = status;
    _applyFilter();
    update();
  }

  void _applyFilter() {
    if (activeFilter == null) {
      filteredApplications = List<ApplicationModel>.from(applications);
    } else {
      filteredApplications = applications
          .where((application) => application.status == activeFilter)
          .toList();
    }
  }

  List<ApplicationStatModel> get stats {
    final pendingCount = applications
        .where((application) => application.status == ApplicationStatus.pending)
        .length;

    final acceptedCount = applications
        .where(
          (application) => application.status == ApplicationStatus.accepted,
        )
        .length;

    final rejectedCount = applications
        .where(
          (application) => application.status == ApplicationStatus.rejected,
        )
        .length;

    return [
      ApplicationStatModel(label: "status_pending".tr, count: pendingCount),
      ApplicationStatModel(label: "status_accepted".tr, count: acceptedCount),
      ApplicationStatModel(label: "status_rejected".tr, count: rejectedCount),
    ];
  }

  @override
  void acceptApplication(String id) {
    final index = applications.indexWhere(
      (application) => application.id == id,
    );

    if (index == -1) return;

    applications[index] = applications[index].copyWith(
      status: ApplicationStatus.accepted,
    );

    _applyFilter();

    Get.defaultDialog(
      title: "success".tr,
      middleText: "applications_accept_success".tr,
    );

    update();

    // TODO: لاحقًا هون بنربط API لقبول الطلب
  }

  @override
  void rejectApplication(String id) {
    final index = applications.indexWhere(
      (application) => application.id == id,
    );

    if (index == -1) return;

    applications[index] = applications[index].copyWith(
      status: ApplicationStatus.rejected,
    );

    _applyFilter();

    Get.defaultDialog(
      title: "success".tr,
      middleText: "applications_reject_success".tr,
    );

    update();

    // TODO: لاحقًا هون بنربط API لرفض الطلب
  }
}
