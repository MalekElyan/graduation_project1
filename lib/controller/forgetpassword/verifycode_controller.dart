import 'package:get/get.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/functions/handlingdata_controller.dart';
import 'package:project/data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController {
  void checkCode();
  void goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  final VerifyCodeForgetData verifyCodeForgetData = VerifyCodeForgetData(
    Get.find(),
  );
  StatusRequest? statusRequest = StatusRequest.non;

  @override
  void checkCode() {}

  @override
  void goToResetPassword(String verifycode) async {
    if (email == null || email!.isEmpty) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await verifyCodeForgetData.postdata(email!, verifycode);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response is Map && response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(title: "تحذير", middleText: "الرمز غير صحيح");
      }
    }

    update();
  }

  @override
  void onInit() {
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      email = args["email"];
    }
    super.onInit();
  }
}
