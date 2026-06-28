import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/location_input_field.dart';
import 'package:lemo_app/gen/assets.gen.dart';

class TripLocationsCard extends StatelessWidget {
  final TextEditingController pickUpController;
  final TextEditingController dropOffController;

  const TripLocationsCard({
    super.key,
    required this.pickUpController,
    required this.dropOffController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.divider),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Timeline Graphic
            Column(
              children: [
                // Top Circle with Blue Car
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: const BoxDecoration(
                    color: AppColors.inputBackground,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(Assets.images.greySuvRM.path, width: 25.w),
                ),
                // Connecting vertical line
                Expanded(
                  child: Center(
                    child: Container(width: 2.w, color: AppColors.primary),
                  ),
                ),
                // Bottom Circle with Location Pin
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: const BoxDecoration(
                    color: AppColors.inputBackground,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.location_on,
                    color: AppColors.primary,
                    size: 20.w,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            // Right Text Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LocationInputField(
                    label: 'Pick up',
                    hintText: 'pick up location',
                    controller: pickUpController,
                  ),
                  SizedBox(height: 16.h),
                  LocationInputField(
                    label: 'Drop-Off',
                    hintText: 'drop-off location',
                    controller: dropOffController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
