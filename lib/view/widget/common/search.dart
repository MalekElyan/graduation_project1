import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class Search extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final IconData icon;
  final EdgeInsetsGeometry? padding;
  final double height;

  const Search({
    super.key,
    required this.hintText,
    this.onTap,
    this.icon = Icons.search,
    this.padding,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: height,
        padding:
            padding ?? const EdgeInsetsDirectional.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.borderCard),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                hintText,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(icon, size: 20, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
