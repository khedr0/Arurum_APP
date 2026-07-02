import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class RequestDetailRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const RequestDetailRow({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.champagneGold, size: 20.sp),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.stoneGray,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                    fontFamily: 'SFProDisplay',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.warmIvory,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
