class PremiumTripRequest {
  final String id;
  final String tripType;
  final double estimatedFare;
  final String pickupLocation;
  final String destination;
  final String? scheduledTime; // Added for scheduled trips
  final String requiredVehicleClass;
  final double distanceKm;

  PremiumTripRequest({
    required this.id,
    required this.tripType,
    required this.estimatedFare,
    required this.pickupLocation,
    required this.destination,
    this.scheduledTime,
    required this.requiredVehicleClass,
    required this.distanceKm,
  });
}
