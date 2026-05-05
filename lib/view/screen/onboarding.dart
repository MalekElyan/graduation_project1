import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/onboarding_controller.dart';
import 'package:project/view/widget/common/actionbtn.dart';
import 'package:project/view/widget/onboarding/customslider.dart';
import 'package:project/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingControllerImp controller = Get.put(
      OnBoardingControllerImp(),
    );

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(flex: 4, child: CustomSliderOnBoarding()),
            const SizedBox(height: 8),
            const CustomDotControllerOnBoarding(),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 24,
                    ),
                    child: AuthPrimaryButton(
                      title: "common_next".tr,
                      onPressed: controller.next,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
