import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class DriverInfoRow extends StatelessWidget {
  final String driverName;
  final String carName;
  final String plateNumber;
  final double rating;

  const DriverInfoRow({
    super.key,
    required this.driverName,
    required this.carName,
    required this.plateNumber,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundColor: AppColors.inputBackground,
          foregroundColor: AppColors.primary,
          child: const Icon(Icons.person),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(driverName, style: AppTextStyles.medium14),

              Text('$carName, $plateNumber', style: AppTextStyles.regular12),
            ],
          ),
        ),

        const Icon(Icons.star, size: 18, color: AppColors.primary),

        SizedBox(width: 4.w),

        Text(rating.toString(), style: AppTextStyles.medium14),
      ],
    );
  }
}
