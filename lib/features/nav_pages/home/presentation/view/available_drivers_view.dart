import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/driver_card.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/trip_info_card.dart';
import 'package:lemo_app/gen/assets.gen.dart';

class AvailableDriversView extends StatelessWidget {
  final String pickUpLocation;
  final String dropOffLocation;
  final String selectedClass;

  const AvailableDriversView({
    super.key,
    required this.pickUpLocation,
    required this.dropOffLocation,
    this.selectedClass = 'Business',
  });

  List<VehicleModel> getDriversForClass(String className) {
    final nameLower = className.toLowerCase().trim();
    if (nameLower == 'executive') {
      return [
        VehicleModel(
          image: Assets.images.rolseR.path,
          name: 'Executive Sedan',
          type: 'Executive',
          driver: 'Ali Mansour',
          rating: 4.8,
          plate: 'XYZ-7890',
          price: 250.0,
          completedTrips: 80,
          carBrand: 'Rolls Royce',
          year: '2022',
          color: 'Black',
        ),
        VehicleModel(
          image: Assets.images.rolseR.path,
          name: 'Executive Sedan',
          type: 'Executive',
          driver: 'Hassan Aly',
          rating: 4.7,
          plate: 'DEF-4567',
          price: 250.0,
          completedTrips: 95,
          carBrand: 'Rolls Royce',
          year: '2021',
          color: 'Black',
        ),
        VehicleModel(
          image: Assets.images.rolseR.path,
          name: 'Executive Sedan',
          type: 'Executive',
          driver: 'Sayed Omar',
          rating: 4.9,
          plate: 'GHI-1234',
          price: 250.0,
          completedTrips: 110,
          carBrand: 'Rolls Royce',
          year: '2023',
          color: 'Black',
        ),
      ];
    } else if (nameLower == 'luxurysuv') {
      return [
        VehicleModel(
          image: Assets.images.greySuvRM.path,
          name: 'Luxury SUV',
          type: 'SUV',
          driver: 'Tarek Fadel',
          rating: 4.8,
          plate: 'KLM-5678',
          price: 350.0,
          completedTrips: 140,
          carBrand: 'Cadillac Escalade',
          year: '2024',
          color: 'Gray',
        ),
        VehicleModel(
          image: Assets.images.greySuvRM.path,
          name: 'Luxury SUV',
          type: 'SUV',
          driver: 'Mostafa Nour',
          rating: 4.7,
          plate: 'NOP-8901',
          price: 350.0,
          completedTrips: 130,
          carBrand: 'Range Rover',
          year: '2023',
          color: 'Black',
        ),
        VehicleModel(
          image: Assets.images.greySuvRM.path,
          name: 'Luxury SUV',
          type: 'SUV',
          driver: 'Waleed Samy',
          rating: 4.6,
          plate: 'QRS-2345',
          price: 350.0,
          completedTrips: 90,
          carBrand: 'Mercedes GLS',
          year: '2024',
          color: 'White',
        ),
      ];
    } else {
      return [
        VehicleModel(
          image: Assets.images.cadilacEAM.path,
          name: 'First Class',
          type: 'First Class',
          driver: 'Mohamed Ahmed',
          rating: 4.9,
          plate: 'ABC-1234',
          price: 500.0,
          completedTrips: 150,
          carBrand: 'Cadillac',
          year: '2025',
          color: 'Black',
        ),
        VehicleModel(
          image: Assets.images.cadilacEAM.path,
          name: 'First Class',
          type: 'First Class',
          driver: 'Ahmed Mohamed',
          rating: 4.8,
          plate: 'ABC-1234',
          price: 500.0,
          completedTrips: 120,
          carBrand: 'Cadillac',
          year: '2025',
          color: 'Black',
        ),
        VehicleModel(
          image: Assets.images.cadilacEAM.path,
          name: 'First Class',
          type: 'First Class',
          driver: 'Omar Khaled',
          rating: 4.9,
          plate: 'XYZ-9999',
          price: 500.0,
          completedTrips: 200,
          carBrand: 'Maybach',
          year: '2025',
          color: 'Black',
        ),
      ];
    }
  }

  List<VehicleModel> get drivers => getDriversForClass(selectedClass);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
            size: 20.w,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Available Drivers',
          style: AppTextStyles.bold20.copyWith(
            fontSize: 20.sp,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripInfoCard(
                numberOfDrivers: drivers.length,
                pickUpLocation: pickUpLocation,
                dropOffLocation: dropOffLocation,
              ),

              SizedBox(height: 20.h),

              // Available drivers list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: drivers.length,
                itemBuilder: (context, index) {
                  return DriverCard(vehicle: drivers[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
