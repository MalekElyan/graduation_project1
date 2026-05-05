import 'package:project/core/class/curd.dart';
import 'package:project/link_api.dart';

class VerifyCodeSignupData {
  final Curd curd;

  VerifyCodeSignupData(this.curd);

  Future<Object> postdata(String email, String verifycode) async {
    var response = await curd.postData(AppLink.verifycodesignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
