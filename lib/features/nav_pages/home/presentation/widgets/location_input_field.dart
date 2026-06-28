import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class LocationInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const LocationInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.regular14),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          style: AppTextStyles.medium18.copyWith(
            color: AppColors.textPrimary,
            fontSize: 16.sp,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primary, width: 1.w),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            isDense: true,
            hintText: hintText,
            hintStyle: AppTextStyles.regular12.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ],
    );
  }
}
