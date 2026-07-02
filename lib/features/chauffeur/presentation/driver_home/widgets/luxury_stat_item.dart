import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class LuxuryStatItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isHighlighted;

  const LuxuryStatItem({
    super.key,
    required this.title,
    required this.value,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isHighlighted
            ? AppColors.champagneGold.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isHighlighted
              ? AppColors.champagneGold
              : AppColors.stoneGray.withValues(alpha: 0.3),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              color: isHighlighted
                  ? AppColors.champagneGold
                  : AppColors.warmIvory,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'SFProDisplay',
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            title, 
            style: AppTextStyles.regular12.copyWith(color: AppColors.stoneGray),
          ),
        ],
      ),
    );
  }
}
