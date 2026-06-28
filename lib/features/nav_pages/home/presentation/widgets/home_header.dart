import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Travel in Luxury',
        textAlign: TextAlign.center,
        style: AppTextStyles.bold20.copyWith(fontSize: 20.sp),
      ),
    );
  }
}
