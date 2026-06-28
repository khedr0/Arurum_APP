import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/review_model.dart';

class ReviewItemWidget extends StatelessWidget {
  final ReviewModel review;

  const ReviewItemWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    // Generate initials for the avatar
    final initials = review.reviewerName.split(' ').map((e) => e[0]).join('');

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Initials avatar
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primary,
                child: Text(
                  initials,
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.black,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              // Reviewer name & date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.reviewerName,
                      style: AppTextStyles.bold16.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      review.date,
                      style: AppTextStyles.regular12.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),

              // Star Rating
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: index < review.rating ? AppColors.primary : AppColors.divider,
                    size: 16.w,
                  );
                }),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // Review text
          Text(
            review.reviewText,
            style: AppTextStyles.regular14.copyWith(
              fontSize: 12.sp,
              color: AppColors.textPrimary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
