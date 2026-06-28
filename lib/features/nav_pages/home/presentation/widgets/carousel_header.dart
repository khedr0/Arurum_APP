import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/view_model/driver_details_view_model.dart';

class CarouselHeader extends StatelessWidget {
  final DriverDetailsViewModel viewModel;

  const CarouselHeader({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final currentIndex = viewModel.currentImageIndex;

    return Stack(
      children: [
        // Car Image Banner
        Container(
          height: 240.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background scenic elements or color
                Container(color: AppColors.inputBackground),
                // Main Car Image
                Image.asset(
                  viewModel.vehicle.image,
                  key: ValueKey<int>(currentIndex),
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),

        // Back Button (Top-Left)
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  color: AppColors.cardBackground,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textPrimary,
                  size: 18.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
