import 'package:get/get.dart';
import 'package:project/core/class/stutusrequest.dart';
import 'package:project/core/functions/handlingdata_controller.dart';
import 'package:project/core/services/services.dart';
import 'package:project/data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];

  StatusRequest? statusRequest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homedata.getData();

    print("=============================== Controller $response");

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response is Map && response['status'] == "success") {
        categories.clear();
        items.clear();

        if (response['categories'] is List) {
          categories.addAll(response['categories']);
        }

        if (response['items'] is List) {
          items.addAll(response['items']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}
