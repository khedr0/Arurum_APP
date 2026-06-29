import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class LuxuryActionButtons extends StatelessWidget {
  final VoidCallback onAccept;
  final VoidCallback onViewDetails;

  const LuxuryActionButtons({
    super.key,
    required this.onAccept,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onViewDetails,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              side: BorderSide(color: AppColors.stoneGray),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text('Cancel', style: AppTextStyles.bold16),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: onAccept,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.champagneGold,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Accept Request',
              style: AppTextStyles.medium14.copyWith(color: AppColors.black),
            ),
          ),
        ),
      ],
    );
  }
}
