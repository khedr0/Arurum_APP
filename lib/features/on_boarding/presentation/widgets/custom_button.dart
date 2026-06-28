import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required int currentPage,
    required List<Map<String, String>> onboardingData,
  }) : _currentPage = currentPage,
       _onboardingData = onboardingData;

  final int _currentPage;
  final List<Map<String, String>> _onboardingData;

  @override
  Widget build(BuildContext context) {
    bool isLast = _currentPage == _onboardingData.length - 1;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 14.h.clamp(12.0, 18.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: isLast ? AppColors.primary : AppColors.cardBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isLast ? 'GET STARTED' : 'CONTINUE',
            style: TextStyle(
              color: isLast ? AppColors.black : AppColors.textPrimary,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: isLast ? AppColors.black : AppColors.textPrimary,
            size: 18.w,
          ),
        ],
      ),
    );
  }
}
