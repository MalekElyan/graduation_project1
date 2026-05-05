import 'package:flutter/material.dart';

class AppCircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = const Color(0x2EFFFFFF),
    this.borderColor = const Color(0x2EFFFFFF),
    this.iconColor = Colors.white,
    this.size = 44,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
        ),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
