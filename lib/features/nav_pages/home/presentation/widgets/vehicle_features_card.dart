import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';

class VehicleFeaturesCard extends StatelessWidget {
  final VehicleModel vehicle;

  const VehicleFeaturesCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.divider, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vehicle Name & License Plate Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.name.isNotEmpty
                          ? (vehicle.name.toLowerCase().contains(
                                  vehicle.carBrand.toLowerCase(),
                                )
                                ? '${vehicle.name} ${vehicle.year}'
                                : '${vehicle.carBrand} ${vehicle.name} ${vehicle.year}')
                          : 'Toyota Camry 2025',
                      style: AppTextStyles.bold16.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      vehicle.type.isNotEmpty ? vehicle.type : 'Luxury Sedan',
                      style: AppTextStyles.regular12.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              // License Plate Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  vehicle.plate.isNotEmpty ? vehicle.plate : 'ABC-1234',
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primary,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Features Row (AC, Chargers, Water)
          Row(
            children: [
              _buildFeatureBadge('AC'),
              SizedBox(width: 8.w),
              _buildFeatureBadge('Chargers'),
              SizedBox(width: 8.w),
              _buildFeatureBadge('Water'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBadge(String featureName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        featureName,
        style: AppTextStyles.medium14.copyWith(
          color: AppColors.textPrimary,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
