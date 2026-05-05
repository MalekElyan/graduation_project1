import 'package:project/controller/splash_controller.dart';
import 'package:project/core/class/curd.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
    Get.put(SplashControllerImp());
  }
}
