import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';

class DriverProfileHeaderCard extends StatelessWidget {
  final VehicleModel vehicle;

  const DriverProfileHeaderCard({super.key, required this.vehicle});

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
        children: [
          // Main Info Row: Avatar, Name, Price & Duration
          Row(
            children: [
              // Avatar Silhouette Container
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryLight,
                    width: 1.5.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.person, color: AppColors.primary, size: 36.w),
              ),
              SizedBox(width: 16.w),

              // Name and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.driver.isNotEmpty
                          ? vehicle.driver
                          : 'Driver Name',
                      style: AppTextStyles.bold16.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Professional Driver',
                      style: AppTextStyles.regular12.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),

              // Price and Duration Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${vehicle.price.toInt()} LE',
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.primary,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '2 Hours 30 mins',
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.darkGrey,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20.h),
          Divider(color: AppColors.divider, height: 1),
          SizedBox(height: 16.h),

          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Rating Stat
              Expanded(
                child: _buildStatItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primary,
                        size: 18.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        vehicle.rating > 0 ? vehicle.rating.toString() : '4.8',
                        style: AppTextStyles.bold16.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  label: 'Ratings',
                ),
              ),
              Container(height: 30.h, width: 1.w, color: AppColors.divider),
              // Trips Stat
              Expanded(
                child: _buildStatItem(
                  child: Text(
                    vehicle.completedTrips > 0
                        ? vehicle.completedTrips.toString()
                        : '150',
                    style: AppTextStyles.bold16.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  label: 'Trips',
                ),
              ),
              Container(height: 30.h, width: 1.w, color: AppColors.divider),
              // Experience Stat
              Expanded(
                child: _buildStatItem(
                  child: Text(
                    '5 Years',
                    style: AppTextStyles.bold16.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  label: 'Experience',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({required Widget child, required String label}) {
    return Column(
      children: [
        child,
        SizedBox(height: 6.h),
        Text(
          label,
          style: AppTextStyles.regular12.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
