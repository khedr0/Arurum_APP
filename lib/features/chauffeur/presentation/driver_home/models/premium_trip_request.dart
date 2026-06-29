class PremiumTripRequest {
  final String id;
  final String tripType;
  final double estimatedFare;
  final String pickupLocation;
  final DateTime pickupTime;
  final String requiredVehicleClass;
  final double distanceKm;

  PremiumTripRequest({
    required this.id,
    required this.tripType,
    required this.estimatedFare,
    required this.pickupLocation,
    required this.pickupTime,
    required this.requiredVehicleClass,
    required this.distanceKm,
  });
}
