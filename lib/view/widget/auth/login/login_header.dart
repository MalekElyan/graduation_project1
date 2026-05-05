import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const LoginHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.person_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 260,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 78,
            height: 78,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1.2,
              ),
            ),
            child: Icon(icon, color: AppColors.white, size: 34),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: const Color(0xffE5E7EB),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
