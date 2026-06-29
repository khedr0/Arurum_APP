import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/models/premium_trip_request.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/widgets/luxury_action_buttons.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/widgets/request_detail_row.dart';

class PremiumRequestCard extends StatelessWidget {
  final PremiumTripRequest request;
  final VoidCallback onAccept;
  final VoidCallback onViewDetails;

  const PremiumRequestCard({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Trip Type & Fare
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(request.tripType, style: AppTextStyles.bold16),
              Text(
                '${request.estimatedFare.toInt()} LE',
                style: TextStyle(
                  color: AppColors.champagneGold,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Details
          RequestDetailRow(
            title: 'Pickup Location',
            value: request.pickupLocation,
            icon: Icons.location_on_outlined,
          ),

          RequestDetailRow(
            title: 'Pickup Time',
            value: DateFormat('dd MMM • HH:mm').format(request.pickupTime),
            icon: Icons.access_time,
          ),

          RequestDetailRow(
            title: 'Distance',
            value: '${request.distanceKm} km',
            icon: Icons.map_outlined,
          ),

          SizedBox(height: 12.h),

          // Action Buttons
          LuxuryActionButtons(onAccept: onAccept, onViewDetails: onViewDetails),
        ],
      ),
    );
  }
}
