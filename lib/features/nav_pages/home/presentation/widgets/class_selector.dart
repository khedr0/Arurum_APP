import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class ClassSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ClassSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final classes = [' executive,luxurySUV,firstClass,'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Class',
          style: AppTextStyles.medium16.copyWith(fontSize: 16.sp),
        ),
        SizedBox(height: 8.h),
        Row(
          children: List.generate(
            classes.length,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: ChoiceChip(
                  label: Center(
                    child: Text(
                      classes[index],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: selectedIndex == index
                            ? AppColors.black
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                  showCheckmark: false,
                  selected: selectedIndex == index,
                  onSelected: (_) => onChanged(index),
                  backgroundColor: AppColors.cardBackground,
                  selectedColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h.clamp(6.0, 14.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                    side: BorderSide(
                      color: selectedIndex == index
                          ? AppColors.primary
                          : AppColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
