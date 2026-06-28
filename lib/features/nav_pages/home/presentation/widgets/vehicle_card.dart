import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;
  final bool isSelected;
  final VoidCallback onTap;

  const VehicleCard({
    super.key,
    required this.vehicle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.divider,
            width: isSelected ? 1.5.w : 1.w,
          ),
        ),
        child: Row(
          children: [
            // Circular Vehicle Image Container
            Container(
              width: 72.w,
              height: 72.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryExtraLight
                    : AppColors.cardBackground,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                vehicle.image,
                width: 80.w,
                height: 55.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 16.w),

            // Vehicle Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vehicle.name,
                    style: AppTextStyles.bold16.copyWith(
                      color: isSelected
                          ? AppColors.black
                          : AppColors.textPrimary,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    vehicle.type,
                    style: AppTextStyles.regular14.copyWith(
                      color: isSelected
                          ? AppColors.black.withOpacity(0.7)
                          : AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text.rich(
                    TextSpan(
                      style: AppTextStyles.regular14.copyWith(
                        color: isSelected
                            ? AppColors.black.withOpacity(0.7)
                            : AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                      children: [
                        const TextSpan(text: 'Starting from   '),
                        TextSpan(
                          text: '${vehicle.price.toInt()} LE',
                          style: AppTextStyles.bold16.copyWith(
                            color: isSelected
                                ? AppColors.black
                                : AppColors.primary,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),

            // Selection Radio/Checkbox Button
            isSelected
                ? Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      color: AppColors.black,
                      size: 14.w,
                    ),
                  )
                : Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.divider,
                        width: 1.5.w,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
