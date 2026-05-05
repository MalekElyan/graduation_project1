// class AppLink {
//   static const String server = "http://192.168.1.134/corsesphp/backend";
//   static const String test = "$server/test.php";
//   static const String imageststatic = "https://192.168.1.134/corsesphp/upload";

//   static const String resendCode = "$server/auth/resendcode.php";

//   /////////////            Auth         //////////////
//   static const String signUp = "$server/auth/signup.php";
//   static const String verifycodesignup = "$server/auth/verifycode.php";
//   static const String login = "$server/auth/login.php";

//   /////////////            forgetpassword         //////////////

//   static const String cheackemail = "$server/forgetpassword/cheackemail.php";
//   static const String verifycode = "$server/forgetpassword/verifycode.php";
//   static const String resetpassword =
//       "$server/forgetpassword/resetpassword.php";

//   /////////////            main pages         //////////////
//   static const String homepage = "$server/main/homepage.php";

//   //========================== Image ============================
//   static const String imagestCategories = "$imageststatic/categories";
//   static const String imagestItems = "$imageststatic/items";
// }
class AppLink {
  static const String server = "https://semisoft-snarl-unless.ngrok-free.dev";

  //========================== Auth ==========================
  static const String login = "$server/api/Login/login";
  static const String signUp = "$server/api/Login/Register";
  static const String confirmAccount = "$server/api/Login/confirm";
  static const String checkUserName = "$server/api/Login/UserName";
  static const String getUserInfo = "$server/api/Login/GetUserInfo";

  //======================= Post Requests =======================
  static const String subscribeToProject =
      "$server/api/PostRequests/subscribeToProject";
  static const String sendPostRequestToManager =
      "$server/api/PostRequests/SendPostRequestToManager";
  static const String updatePostRequestStatus =
      "$server/api/PostRequests/UpdateStatus";
  static const String getAllRequestsByProjectId =
      "$server/api/PostRequests/GetAllRequestsByProjectID";

  //========================== Posts ==========================
  static const String createPost = "$server/api/Posts/Create";
  static const String getAllProject = "$server/api/Posts/GetAllProject";
  static const String getProjectById = "$server/api/Posts/GetProjectById";
  static const String getUserByProjectId =
      "$server/api/Posts/GetUserByProjectId";

  //========================== Teams ==========================
  static const String getUserTeams = "$server/api/Teams/GetUserTeams";
  static const String getAllTeamMembersByProjectId =
      "$server/api/Teams/GetAllTeamMembersByProjectId";
  static const String updateTeamMemberRate =
      "$server/api/Teams/updateTeamMemberRate";
  static const String addTaskByTeamID = "$server/api/Teams/addTaskByTeamID";

  static const String test = "$server/test.php";
  static const String imageststatic = "https://192.168.1.134/corsesphp/upload";

  static const String resendCode = "$server/auth/resendcode.php";

  /////////////            Auth         //////////////

  static const String verifycodesignup = "$server/auth/verifycode.php";

  /////////////            forgetpassword         //////////////

  static const String cheackemail = "$server/forgetpassword/cheackemail.php";
  static const String verifycode = "$server/forgetpassword/verifycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  /////////////            main pages         //////////////
  static const String homepage = "$server/main/homepage.php";

  //========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
}
