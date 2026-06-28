import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';

class TripActions extends StatelessWidget {
  const TripActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'View Details',
            height: 44.h,
            borderRadius: 8.r,
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.medium14.copyWith(
              color: AppColors.primary,
            ),
            onPressed: () {},
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: CustomButton(
            text: 'Book Again',
            height: 44.h,
            borderRadius: 8.r,
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.black,
            textStyle: AppTextStyles.medium14.copyWith(color: AppColors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
