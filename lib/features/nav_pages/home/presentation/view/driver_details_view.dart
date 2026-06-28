import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/view_model/driver_details_view_model.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/carousel_header.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/driver_profile_header_card.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/review_item_widget.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/vehicle_features_card.dart';

class DriverDetailsView extends StatefulWidget {
  final VehicleModel vehicle;

  const DriverDetailsView({super.key, required this.vehicle});

  @override
  State<DriverDetailsView> createState() => _DriverDetailsViewState();
}

class _DriverDetailsViewState extends State<DriverDetailsView> {
  late final DriverDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = DriverDetailsViewModel(vehicle: widget.vehicle);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Carousel Header & Floating Profile Card Stack
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CarouselHeader(viewModel: _viewModel),
                          Positioned(
                            bottom: -120.h,
                            left: 20.w,
                            right: 20.w,
                            child: DriverProfileHeaderCard(
                              vehicle: _viewModel.vehicle,
                            ),
                          ),
                        ],
                      ),
                      // Height gap to offset the overlapping Profile Card
                      SizedBox(height: 140.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Vehicle Features Card
                            VehicleFeaturesCard(vehicle: _viewModel.vehicle),
                            SizedBox(height: 24.h),

                            // Client Reviews Section
                            Text(
                              'Client Reviews',
                              style: AppTextStyles.bold20.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 12.h),

                            // Scrollable List of Reviews
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: _viewModel.reviews.length,
                              itemBuilder: (context, index) {
                                return ReviewItemWidget(
                                  review: _viewModel.reviews[index],
                                );
                              },
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Sticky Action Buttons
              Container(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 12.h,
                  bottom: 24.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: CustomButton(
                        text: 'Cancel Trip',
                        height: 48.h,
                        borderRadius: 24.r,
                        backgroundColor: AppColors.greyButton,
                        foregroundColor: AppColors.textPrimary,
                        textStyle: AppTextStyles.bold16.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.textPrimary,
                        ),
                        onPressed: () => _viewModel.cancelTrip(context),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    // Accept Button
                    Expanded(
                      child: CustomButton(
                        text: 'Accept Trip',
                        height: 48.h,
                        borderRadius: 24.r,
                        textStyle: AppTextStyles.bold16.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.black,
                        ),
                        onPressed: () => _viewModel.acceptTrip(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
