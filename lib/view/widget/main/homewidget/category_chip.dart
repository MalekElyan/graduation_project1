import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class HomeCategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const HomeCategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chip = Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryGreen : AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFD9DED9)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.white : const Color(0xFF333333),
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    if (onTap == null) return chip;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: chip,
    );
  }
}
