import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/routing/route_paths.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';

class DriverCard extends StatelessWidget {
  final VehicleModel vehicle;

  const DriverCard({super.key, required this.vehicle});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
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
          // Driver Profile Info Header
          Row(
            children: [
              // Avatar Silhouette Container
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryLight,
                    width: 1.5.w,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.person, color: AppColors.primary, size: 24.w),
              ),
              SizedBox(width: 12.w),

              // Name and Completed Trips
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.driver,
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '${vehicle.completedTrips} Trips Completed',
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // Rating Gold Star
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.primary, size: 18.w),
                  SizedBox(width: 4.w),
                  Text(
                    vehicle.rating.toString(),
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Car Image + Price Badge Overlay
          Stack(
            children: [
              Center(
                child: Image.asset(
                  vehicle.image,
                  height: 120.h.clamp(80.0, 140.0),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h.clamp(4.0, 12.0),
                ),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${vehicle.price.toInt()} LE/Trip',
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primary,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Car Specs Grid
          Row(
            children: [
              Expanded(child: _buildSpecBox('Car Brand', vehicle.carBrand)),
              SizedBox(width: 12.w),
              Expanded(child: _buildSpecBox('License Plate', vehicle.plate)),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(child: _buildSpecBox('Year', vehicle.year)),
              SizedBox(width: 12.w),
              Expanded(child: _buildSpecBox('Color', vehicle.color)),
            ],
          ),
          SizedBox(height: 16.h),

          // Cancel & Accept Buttons
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Cancel Trip',
                  height: 44.h,
                  borderRadius: 24.r,
                  backgroundColor: AppColors.greyButton,
                  foregroundColor: AppColors.textPrimary,
                  textStyle: AppTextStyles.bold16.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomButton(
                  text: 'Accept Trip',
                  height: 44.h,
                  borderRadius: 24.r,
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.black,
                  textStyle: AppTextStyles.bold16.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // View Details Link
          Center(
            child: InkWell(
              onTap: () {
                context.push(RoutePaths.driverDetails, extra: vehicle);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View Details',
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.chevron_right,
                      size: 16.w,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecBox(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.regular12.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h.clamp(6.0, 14.0),
          ),
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.textPrimary,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
