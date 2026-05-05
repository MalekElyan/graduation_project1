import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/core/localization/changelocal.dart';
import 'package:project/view/widget/common/actionbtn.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language_rounded,
                  size: 72,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 24),

                Text(
                  "choose_language".tr,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "language_page_subtitle".tr,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),

                const SizedBox(height: 32),

                AuthPrimaryButton(
                  title: "language_arabic".tr,
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.offNamed(AppRoute.onBoarding);
                  },
                ),

                const SizedBox(height: 14),

                AuthPrimaryButton(
                  title: "language_english".tr,
                  isFilled: false,
                  onPressed: () {
                    controller.changeLang("en");
                    Get.offNamed(AppRoute.onBoarding);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
