import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  void goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  void goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
