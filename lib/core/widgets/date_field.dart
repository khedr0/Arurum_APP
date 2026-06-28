import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class DateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String title;
  final String hintText;
  final IconData suffixIcon;

  const DateField({
    super.key,
    required this.controller,
    required this.onTap,
    required this.title,
    required this.hintText,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.regular14.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        TextField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          style: AppTextStyles.medium14.copyWith(fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14.sp),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h.clamp(8.0, 16.0),
            ),
            suffixIcon: Icon(suffixIcon, size: 20.w),
          ),
        ),
      ],
    );
  }
}
