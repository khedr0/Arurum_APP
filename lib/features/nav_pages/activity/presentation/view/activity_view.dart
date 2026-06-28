import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/features/nav_pages/activity/data/models/trip_model.dart';
import 'package:lemo_app/features/nav_pages/activity/presentation/widgets/trip_card.dart';

import '../widgets/trip_status_tabs.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final List<TripModel> trips = [
    const TripModel(
      pickup: 'Smouha',
      dropOff: 'Multiple Destinations',
      date: '18 March 2026',
      driverName: 'Mohamed Ahmed',
      carName: 'Kia Sportage',
      plateNumber: 'ABC-1234',
      rating: 4.8,
      price: 500,
      status: TripStatus.completed,
    ),

    const TripModel(
      pickup: 'Airport',
      dropOff: 'Stanley',
      date: '20 March 2026',
      driverName: 'Sara Mohamed',
      carName: 'Toyota Camry',
      plateNumber: 'XYZ-7788',
      rating: 4.9,
      price: 300,
      status: TripStatus.upcoming,
    ),

    const TripModel(
      pickup: 'Miami',
      dropOff: 'Sidi Gaber',
      date: '15 March 2026',
      driverName: 'Nour Ahmed',
      carName: 'Hyundai Elantra',
      plateNumber: 'DDD-1111',
      rating: 4.7,
      price: 250,
      status: TripStatus.cancelled,
    ),
    TripModel(
      pickup: 'Smouha',
      dropOff: 'Multiple Destinations',
      date: '18 March 2026',
      driverName: 'Mohamed Ahmed',
      carName: 'Kia Sportage',
      plateNumber: 'ABC-1234',
      rating: 4.8,
      price: 500,
      status: TripStatus.completed,
    ),
  ];

  int selectedTab = 0;

  List<TripModel> get filteredTrips {
    switch (selectedTab) {
      case 0:
        return trips
            .where((trip) => trip.status == TripStatus.completed)
            .toList();

      case 1:
        return trips
            .where((trip) => trip.status == TripStatus.upcoming)
            .toList();

      case 2:
        return trips
            .where((trip) => trip.status == TripStatus.cancelled)
            .toList();

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Trips', style: Theme.of(context).textTheme.titleLarge),

            SizedBox(height: 16.h),

            TripStatusTabs(
              selectedIndex: selectedTab,
              onChanged: (index) {
                setState(() {
                  selectedTab = index;
                });
              },
            ),

            SizedBox(height: 20.h),

            Expanded(
              child: ListView.separated(
                itemCount: filteredTrips.length,
                separatorBuilder: (_, __) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final trip = filteredTrips[index];

                  return TripCard(trip: trip);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
