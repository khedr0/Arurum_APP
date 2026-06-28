import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/activity/data/models/trip_model.dart';

import 'driver_info_row.dart';
import 'trip_actions.dart';
import 'trip_location_section.dart';

class TripCard extends StatelessWidget {
  final TripModel trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(trip.status.name, style: AppTextStyles.regular12.copyWith(color: AppColors.primary)),
              ),

              const Spacer(),

              Text('${trip.price.toInt()} LE', style: AppTextStyles.bold16),
            ],
          ),

          SizedBox(height: 16.h),

          TripLocationSection(
            pickup: trip.pickup,
            dropOff: trip.dropOff,
            date: trip.date,
          ),

          SizedBox(height: 16.h),

          Divider(height: 1.h),

          SizedBox(height: 16.h),

          DriverInfoRow(
            driverName: trip.driverName,
            carName: trip.carName,
            plateNumber: trip.plateNumber,
            rating: trip.rating,
          ),

          SizedBox(height: 16.h),

          const TripActions(),
        ],
      ),
    );
  }
}
