import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class LuxuryActionButtons extends StatelessWidget {
  final VoidCallback onAccept;
  final VoidCallback onSecondaryAction;
  final String primaryActionText;
  final String secondaryActionText;

  const LuxuryActionButtons({
    super.key,
    required this.onAccept,
    required this.onSecondaryAction,
    this.primaryActionText = 'Accept Request',
    this.secondaryActionText = 'View Details',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onSecondaryAction,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              side: BorderSide(color: AppColors.stoneGray),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              secondaryActionText,
              style: AppTextStyles.bold14.copyWith(color: AppColors.warmIvory),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: onAccept,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            child: Text(
              primaryActionText,
              style: AppTextStyles.medium14.copyWith(color: AppColors.black),
            ),
          ),
        ),
      ],
    );
  }
}
