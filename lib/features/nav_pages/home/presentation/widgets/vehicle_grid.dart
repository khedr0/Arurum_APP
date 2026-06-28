import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';

import 'vehicle_card.dart';

class VehicleList extends StatelessWidget {
  final int selectedVehicle;
  final ValueChanged<int> onChanged;
  final List<VehicleModel> vehicles;

  const VehicleList({
    super.key,
    required this.selectedVehicle,
    required this.onChanged,
    required this.vehicles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Class',
          style: AppTextStyles.medium18.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 14.h),
        Column(
          children: List.generate(
            vehicles.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == vehicles.length - 1 ? 0 : 12.h,
              ),
              child: VehicleCard(
                vehicle: vehicles[index],
                isSelected: selectedVehicle == index,
                onTap: () => onChanged(index),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
