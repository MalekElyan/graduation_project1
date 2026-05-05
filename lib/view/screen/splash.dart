import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/splash_controller.dart';
import 'package:project/core/constant/app_colors.dart';

class SplashScreen extends GetView<SplashControllerImp> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Directionality(
      textDirection: Get.locale?.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.primaryGreen,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -80,
                right: -70,
                child: _SplashCircle(size: 190, opacity: 0.08),
              ),

              Positioned(
                bottom: -90,
                left: -75,
                child: _SplashCircle(size: 220, opacity: 0.07),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 118,
                        height: 118,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.20),
                            width: 1.4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.10),
                              blurRadius: 22,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 82,
                            height: 82,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.16),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.school_rounded,
                              color: Colors.white,
                              size: 44,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Text(
                        "app_name".tr,
                        textAlign: TextAlign.center,
                        style: textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          height: 1.35,
                        ),
                      ),

                      const SizedBox(height: 12),

                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 320),
                        child: Text(
                          "app_subtitle".tr,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withValues(alpha: 0.86),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.6,
                          ),
                        ),
                      ),

                      const SizedBox(height: 42),

                      SizedBox(
                        width: 34,
                        height: 34,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white.withValues(alpha: 0.92),
                          backgroundColor: Colors.white.withValues(alpha: 0.16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashCircle extends StatelessWidget {
  final double size;
  final double opacity;

  const _SplashCircle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: opacity),
          width: 28,
        ),
      ),
    );
  }
}
