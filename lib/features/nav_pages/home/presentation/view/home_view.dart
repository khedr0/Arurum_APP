import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/routing/route_paths.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/book_ride_button.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/date_time_section.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/home_header.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/trip_locations_card.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/widgets/vehicle_grid.dart';
import 'package:lemo_app/gen/assets.gen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final pickUpController = TextEditingController();
  final dropOffController = TextEditingController();

  final List<VehicleModel> vehicles = [
    VehicleModel(
      image: Assets.images.rolseR.path,
      name: 'executive',
      type: 'Affordable rides',
      driver: '',
      rating: 0,
      plate: '',
      price: 250,
    ),
    VehicleModel(
      image: Assets.images.greySuvRM.path,
      name: 'luxurySUV',
      type: 'More space & comfort',
      driver: '',
      rating: 0,
      plate: '',
      price: 350,
    ),
    VehicleModel(
      image: Assets.images.cadilacEAM.path,
      name: 'firstClass',
      type: 'Premium experience',
      driver: '',
      rating: 0,
      plate: '',
      price: 500,
    ),
  ];

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    pickUpController.dispose();
    dropOffController.dispose();
    super.dispose();
  }

  int selectedTripType = 0;
  int selectedClass = 0;
  int selectedVehicle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),

              SizedBox(height: 24.h),

              TripLocationsCard(
                pickUpController: pickUpController,
                dropOffController: dropOffController,
              ),

              SizedBox(height: 20.h),

              DateTimeSection(
                dateController: dateController,
                timeController: timeController,
              ),

              SizedBox(height: 30.h),

              VehicleList(
                selectedVehicle: selectedVehicle,
                onChanged: (index) {
                  setState(() {
                    selectedVehicle = index;
                    selectedClass = index;
                  });
                },
                vehicles: vehicles,
              ),

              SizedBox(height: 24.h),

              BookRideButton(
                onPressed: () {
                  final pickUpText = pickUpController.text.trim();
                  final dropOffText = dropOffController.text.trim();
                  final vehicleClass = vehicles[selectedVehicle].name;
                  context.push(
                    RoutePaths.rideDetails,
                    extra: {
                      'pickUp': pickUpText.isEmpty
                          ? 'PickUp Location'
                          : pickUpText,
                      'dropOff': dropOffText.isEmpty
                          ? 'DropOff Location'
                          : dropOffText,
                      'selectedClass': vehicleClass,
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
