import 'package:flutter/material.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/models/premium_trip_request.dart';

class DriverHomeViewModel extends ChangeNotifier {
  // Statistics
  int newRequestsCount = 4;
  int scheduledTripsCount = 1;
  double todaysEarnings = 1250.0;

  // Available Requests List
  List<PremiumTripRequest> availableRequests = [
    PremiumTripRequest(
      id: 'r1',
      tripType: 'Airport Transfer',
      estimatedFare: 450.0,
      pickupLocation: 'Borg El Arab International Airport',
      pickupTime: DateTime.now().add(const Duration(hours: 2)),
      requiredVehicleClass: 'Mercedes S-Class',
      distanceKm: 28.5,
    ),
    PremiumTripRequest(
      id: 'r2',
      tripType: 'Corporate Ride',
      estimatedFare: 250.0,
      pickupLocation: 'San Stefano Grand Plaza',
      pickupTime: DateTime.now().add(const Duration(hours: 4)),
      requiredVehicleClass: 'BMW 5 Series',
      distanceKm: 14.0,
    ),
    PremiumTripRequest(
      id: 'r3',
      tripType: 'City Transfer',
      estimatedFare: 150.0,
      pickupLocation: 'Smouha Club',
      pickupTime: DateTime.now().add(const Duration(hours: 6)),
      requiredVehicleClass: 'Mercedes E-Class',
      distanceKm: 8.5,
    ),
  ];

  // Accept request logic
  void acceptRequest(String requestId) {
    availableRequests.removeWhere((req) => req.id == requestId);
    newRequestsCount = availableRequests.length;
    scheduledTripsCount++;
    notifyListeners();
  }
}
