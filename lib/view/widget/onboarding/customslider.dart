import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/onboarding_controller.dart';
import 'package:project/core/constant/app_colors.dart';
import 'package:project/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        final item = onBoardingList[i];

        return Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 390,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(42),
                      bottomRight: Radius.circular(42),
                    ),
                  ),
                ),

                Positioned(
                  top: 55,
                  left: -25,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Positioned(
                  top: 20,
                  right: -35,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 58,
                      start: 28,
                      end: 28,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.10),
                        ),
                      ),
                      child: Image.asset(
                        item.image!,
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 42),

            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: Text(
                item.title!.tr,
                textAlign: TextAlign.center,
                style: textTheme.headlineLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  height: 1.35,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: Text(
                item.body!.tr,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  height: 1.9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
