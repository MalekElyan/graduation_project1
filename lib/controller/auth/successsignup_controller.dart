import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  void goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  void goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
