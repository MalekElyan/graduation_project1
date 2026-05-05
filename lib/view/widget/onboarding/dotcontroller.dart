import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/onboarding_controller.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onBoardingList.length,
          (index) => AnimatedContainer(
            margin: const EdgeInsetsDirectional.only(end: 6),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: controller.currentPage == index ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: controller.currentPage == index
                  ? AppColors.primaryGreen
                  : AppColors.badgeDoneBorder,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
