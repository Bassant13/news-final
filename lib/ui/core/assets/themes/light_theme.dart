import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/ui/core/assets/app_colors.dart';
import 'package:news_app_final/ui/core/assets/app_fonts.dart';

ThemeData get lightTheme{
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.white,
      centerTitle: true,
      toolbarHeight: 100.h,
    ),
    textTheme: TextTheme(
      titleLarge: AppFonts.whiteBold24,
      titleMedium: AppFonts.whiteBold20,
      titleSmall: AppFonts.whiteMedium14,

      labelLarge: AppFonts.lightGreyMedium16,
      labelMedium: AppFonts.lightGreyMedium14,
      labelSmall: AppFonts.lightGreyMedium12,

      headlineLarge: AppFonts.blackBold24,
      headlineMedium: AppFonts.blackMedium24,
      headlineSmall: AppFonts.blackMedium20,
      bodyLarge: AppFonts.blackBold16,
      bodyMedium: AppFonts.blackMedium14,
    )
  );
}