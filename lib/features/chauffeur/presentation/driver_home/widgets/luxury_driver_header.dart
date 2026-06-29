import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';

class LuxuryDriverHeader extends StatelessWidget {
  final String driverName;
  final VoidCallback onProfileTap;

  const LuxuryDriverHeader({
    super.key,
    required this.driverName,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning,',
              style: TextStyle(
                color: AppColors.stoneGray, // Secondary text color
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                fontFamily: 'SFProDisplay',
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              driverName,
              style: TextStyle(
                color: AppColors.warmIvory, // Primary text on dark background
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontFamily: 'SFProDisplay',
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onProfileTap,
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.champagneGold.withValues(alpha: 0.5),
                width: 1.w,
              ),
            ),
            child: CircleAvatar(
              radius: 26.r,
              backgroundColor: AppColors.charcoalGray,
              child: Icon(
                Icons.person_outline,
                color: AppColors.warmIvory,
                size: 28.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
