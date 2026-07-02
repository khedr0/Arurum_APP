import 'package:flutter/material.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/models/premium_trip_request.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/models/active_trip_model.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/models/trip_status.dart';

class DriverHomeViewModel extends ChangeNotifier {
  // Driver Status
  bool isOnline = true;

  // Statistics
  int completedToday = 3;
  int activeTripsCount = 1;
  double todaysEarnings = 1250.0;

  // Active Trip
  ActiveTripModel? activeTrip;

  bool get isBusy => activeTrip != null;
  TripStatus? get currentTripStatus => activeTrip?.tripStatus;

  // Available Requests List
  List<PremiumTripRequest> availableRequests = [
    PremiumTripRequest(
      id: 'r1',
      tripType: 'Airport Transfer',
      estimatedFare: 450.0,
      pickupLocation: 'Borg El Arab International Airport',
      destination: 'Four Seasons Alexandria',
      requiredVehicleClass: 'Mercedes S-Class',
      distanceKm: 28.5,
    ),
    PremiumTripRequest(
      id: 'r2',
      tripType: 'Corporate Ride',
      estimatedFare: 250.0,
      pickupLocation: 'San Stefano Grand Plaza',
      destination: 'Bibliotheca Alexandrina',
      requiredVehicleClass: 'BMW 5 Series',
      distanceKm: 14.0,
    ),
    PremiumTripRequest(
      id: 'r3',
      tripType: 'City Transfer',
      estimatedFare: 150.0,
      pickupLocation: 'Smouha Club',
      destination: 'Stanley Bridge',
      requiredVehicleClass: 'Mercedes E-Class',
      distanceKm: 8.5,
    ),
  ];

  // Actions
  void toggleOnlineStatus() {
    isOnline = !isOnline;
    if (!isOnline) {
      availableRequests.clear();
    } else {
      // Re-populate mock requests when going online
      availableRequests = [
        PremiumTripRequest(
          id: 'r1',
          tripType: 'Airport Transfer',
          estimatedFare: 450.0,
          pickupLocation: 'Borg El Arab International Airport',
          destination: 'Four Seasons Alexandria',
          requiredVehicleClass: 'Mercedes S-Class',
          distanceKm: 28.5,
        ),
      ];
    }
    notifyListeners();
  }

  void acceptRequest(String requestId) {
    if (isBusy) return; // Cannot accept if already busy

    final accepted = availableRequests.firstWhere((req) => req.id == requestId);
    availableRequests.removeWhere((req) => req.id == requestId);
    
    // Simulate assigning the active trip to enter busy mode
    activeTrip = ActiveTripModel(
      id: accepted.id,
      pickupLocation: accepted.pickupLocation,
      destination: accepted.destination,
      passengerName: 'VIP Passenger', // Mock passenger name
      tripStatus: TripStatus.headingToPickup,
    );
    
    activeTripsCount++;
    notifyListeners();
  }

  void cancelTrip() {
    if (!isBusy) return;
    
    // Simulate cancelling the active trip and returning to Available mode
    activeTrip = null;
    if (activeTripsCount > 0) activeTripsCount--;
    
    notifyListeners();
  }

  void advanceTripStatus() {
    if (activeTrip == null) return;
    
    if (activeTrip!.tripStatus == TripStatus.headingToPickup) {
      activeTrip = activeTrip!.copyWith(tripStatus: TripStatus.arrivedAtPickup);
    } else if (activeTrip!.tripStatus == TripStatus.arrivedAtPickup) {
      activeTrip = activeTrip!.copyWith(tripStatus: TripStatus.passengerOnBoard);
    } else if (activeTrip!.tripStatus == TripStatus.passengerOnBoard) {
      activeTrip = activeTrip!.copyWith(tripStatus: TripStatus.headingToDestination);
    } else if (activeTrip!.tripStatus == TripStatus.headingToDestination) {
      activeTrip = activeTrip!.copyWith(tripStatus: TripStatus.tripCompleted);
    }
    
    notifyListeners();
  }

  void arriveAtPickup() {
    if (activeTrip?.tripStatus == TripStatus.headingToPickup) {
      activeTrip = activeTrip!.copyWith(tripStatus: TripStatus.arrivedAtPickup);
      notifyListeners();
    }
  }

  void startHeadingToDestination() {
    if (activeTrip?.tripStatus == TripStatus.passengerOnBoard) {
      activeTrip = activeTrip!.copyWith(tripStatus: TripStatus.headingToDestination);
      notifyListeners();
    }
  }

  void completeTrip() {
    if (!isBusy) return;
    
    // Simulate completing the trip
    activeTrip = null;
    notifyListeners();
  }
}
