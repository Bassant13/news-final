import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/ui/core/assets/app_colors.dart';
import 'package:news_app_final/ui/core/assets/app_fonts.dart';

ThemeData get darkTheme{
  return ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.black,
        centerTitle: true,
        toolbarHeight: 100.h,
      ),
      textTheme: TextTheme(
        titleLarge: AppFonts.blackBold24,
        titleMedium: AppFonts.blackBold20,
        titleSmall: AppFonts.blackMedium14,
        labelLarge: AppFonts.lightGreyMedium16,
        labelMedium: AppFonts.lightGreyMedium14,
        labelSmall: AppFonts.lightGreyMedium12,
        headlineLarge: AppFonts.whiteBold24,
        headlineMedium: AppFonts.whiteMedium24,
        headlineSmall: AppFonts.whiteMedium20,
        bodyLarge: AppFonts.whiteBold16,
        bodyMedium: AppFonts.whiteMedium14,
      )
  );
}