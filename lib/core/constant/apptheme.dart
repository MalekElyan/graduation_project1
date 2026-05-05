import 'package:flutter/material.dart';
import 'package:project/core/constant/app_colors.dart';

ThemeData themeEnglish = _buildAppTheme(fontFamily: "PlayfairDisplay");
ThemeData themeArabic = _buildAppTheme(fontFamily: "Cairo");

ThemeData _buildAppTheme({required String fontFamily}) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColors.backgroundScreenLight,
    primaryColor: AppColors.primaryGreen,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryGreen,
      secondary: AppColors.lightGreenTextDark,
      surface: AppColors.backgroundCard,
      error: Colors.red,
      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      onSurface: AppColors.textPrimary,
      onError: AppColors.white,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: AppColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: AppColors.textPrimary,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.7,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(fontSize: 14, height: 1.6, color: AppColors.grey),
      bodySmall: TextStyle(fontSize: 12, height: 1.5, color: AppColors.grey),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    ),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.primaryGreen,
      foregroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      iconTheme: IconThemeData(color: AppColors.white, size: 22),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryGreen,
        minimumSize: const Size(double.infinity, 54),
        side: const BorderSide(color: AppColors.badgeDoneBorder, width: 1.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundCard,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: const TextStyle(color: AppColors.grey, fontSize: 14),
      labelStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      prefixIconColor: AppColors.grey,
      suffixIconColor: AppColors.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.borderCard),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.borderCard),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.backgroundCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.borderCard),
      ),
      margin: EdgeInsets.zero,
    ),

    dividerColor: AppColors.borderCard,

    iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 22),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryGreen,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryGreen;
        }
        return Colors.transparent;
      }),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.textPrimary,
      contentTextStyle: const TextStyle(color: AppColors.white, fontSize: 14),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
