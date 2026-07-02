import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.overrideColor,
    this.textColor,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? overrideColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: overrideColor ?? AppColors.champagneGold,
        foregroundColor: textColor ?? AppColors.black,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18.sp),
          SizedBox(width: 4.w),
          Text(
            label,
            style: AppTextStyles.medium14.copyWith(
              color: textColor ?? AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
