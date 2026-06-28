import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/theme/app_colors.dart';

class TripLocationSection extends StatelessWidget {
  final String pickup;
  final String dropOff;
  final String date;

  const TripLocationSection({
    super.key,
    required this.pickup,
    required this.dropOff,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_outlined, size: 18, color: AppColors.primary),

            SizedBox(width: 8.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pickup', style: AppTextStyles.regular12),
                  Text(pickup, style: AppTextStyles.medium14),
                  Text(date, style: AppTextStyles.regular12),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_pin, size: 18, color: AppColors.primary),

            SizedBox(width: 8.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Drop-off', style: AppTextStyles.regular12),
                  Text(dropOff, style: AppTextStyles.medium14),
                  Text(date, style: AppTextStyles.regular12),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
