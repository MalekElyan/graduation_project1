import 'package:project/core/class/curd.dart';
import 'package:project/link_api.dart';

class LoginData {
  Curd curd;
  LoginData(this.curd);

  Future<dynamic> postdata(String identifier, String password) async {
    var response = await curd.postJsonData(AppLink.login, {
      "identifier": identifier,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
