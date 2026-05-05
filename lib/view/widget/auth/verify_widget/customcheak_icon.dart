import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final double containerSize;

  const CustomIcon({
    super.key,
    required this.icon,
    this.size = 46,
    this.containerSize = 96,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: AppColors.primaryGreenSoft,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.primaryGreenBorder),
      ),
      child: Center(
        child: Icon(icon, size: size, color: AppColors.primaryGreen),
      ),
    );
  }
}
