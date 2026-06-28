import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get join => TextStyle(
    fontFamily: 'Skytone',
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static TextStyle get bold24 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get bold20 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get bold16 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get medium18 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle get medium16 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle get medium14 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle get regular14 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static TextStyle get regular12 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static TextStyle get cButton18 => TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
}
