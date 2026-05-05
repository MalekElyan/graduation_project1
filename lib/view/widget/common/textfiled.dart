import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

class CustomTextfiledAuth extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool obscureText;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTap;
  final bool readOnly;
  final int maxLines;
  final TextInputAction? textInputAction;

  const CustomTextfiledAuth({
    super.key,
    required this.labeltext,
    required this.hinttext,
    this.prefixIcon,
    this.suffixIcon,
    this.mycontroller,
    this.valid,
    this.isNumber = false,
    this.obscureText = false,
    this.onTapSuffixIcon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      textDirection: Directionality.of(context),
      controller: mycontroller,
      validator: valid,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: obscureText ? 1 : maxLines,
      textInputAction: textInputAction,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      obscureText: obscureText,
      style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hinttext,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsetsDirectional.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: AppColors.grey),
        suffixIcon: suffixIcon == null
            ? null
            : InkWell(
                onTap: onTapSuffixIcon,
                child: Icon(suffixIcon, color: AppColors.grey),
              ),
      ),
    );
  }
}
