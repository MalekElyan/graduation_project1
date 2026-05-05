import 'package:get/get.dart';
import 'package:project/cloude_page/viewandwidget/applications_page.dart';

import 'package:project/core/constant/routes.dart';
import 'package:project/core/middleware/mymiddleware.dart';
import 'package:project/view/screen/Profile/editprofile.dart';
import 'package:project/view/screen/Profile/profilepage.dart';
import 'package:project/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:project/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:project/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:project/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:project/view/screen/auth/login.dart';

import 'package:project/view/screen/auth/signup/registerprofilepage.dart';
import 'package:project/view/screen/auth/signup/signup.dart';
import 'package:project/view/screen/auth/signup/success_signup.dart';
import 'package:project/view/screen/auth/signup/verifycodesignup.dart';
import 'package:project/view/screen/language.dart';
import 'package:project/view/screen/main/home.dart';
import 'package:project/view/screen/main/mainscreen.dart';
import 'package:project/view/screen/onboarding.dart';
import 'package:project/view/screen/splash.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [MyMiddleWare()],
  ),

  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const RegisterPageOne()),
  GetPage(
    name: AppRoute.RegisterProfilePageTow,
    page: () => const RegisterProfilePageTow(),
  ),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoute.successResetpassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
    name: AppRoute.verfiyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),

  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  // Profile
  GetPage(name: AppRoute.profile, page: () => const ProfilePage()),
  GetPage(name: AppRoute.editProfile, page: () => const EditProfilePage()),

  // Main
  GetPage(name: AppRoute.main, page: () => const MainScreen()),
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  GetPage(
    name: AppRoute.applicationsPage,
    page: () => const ApplicationsPage(),
  ),

  // Language
  GetPage(name: AppRoute.language, page: () => const Language()),
];
