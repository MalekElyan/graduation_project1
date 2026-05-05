import 'package:image_picker/image_picker.dart';
import 'package:project/core/class/curd.dart';
import 'package:project/link_api.dart';

class SignupData {
  Curd curd;
  SignupData(this.curd);

  Future<dynamic> postdata({
    required String fullName,
    required String email,
    required String userName,
    required String password,
    XFile? profileImage,
    required String skills,
    required String githubUrl,
    required String workField,
    required String specialization,
    required String description,
    required bool role,
  }) async {
    var response = await curd.postMultipartData(
      AppLink.signUp,
      {
        "FullName": fullName,
        "Email": email,
        "UserName": userName,
        "Password": password,
        "skills": skills,
        "githubUrl": githubUrl,
        "workField": workField,
        "Specialization": specialization,
        "Description": description,
        "Role": role.toString(),
      },
      file: profileImage,
      fileFieldName: "ProfileImage",
    );

    return response.fold((l) => l, (r) => r);
  }
}
