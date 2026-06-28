import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: const BoxDecoration(
        color: AppColors.background, // Light blue header background
      ),
      child: Row(
        children: [
          // Avatar with + badge
          Stack(
            children: [
              Container(
                width: 90.w,
                height: 90.w,
                decoration: const BoxDecoration(
                  color: AppColors.inputBackground,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(Icons.person, color: AppColors.primary, size: 50.w),
              ),
              Positioned(
                bottom: 2.h,
                right: 2.w,
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.add, color: AppColors.black, size: 16.w),
                ),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rawan Shawky', style: AppTextStyles.join),
                SizedBox(height: 4.h),
                Text('rshawky@gmail.com', style: AppTextStyles.regular12),
                SizedBox(height: 8.h),
                // Badges Wrap
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    // Rating Badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 12.w,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '4.8',
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // VIP Badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'VIP Member',
                        style: AppTextStyles.regular12.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
