enum TripStatus { completed, upcoming, cancelled }

class TripModel {
  final String pickup;
  final String dropOff;
  final String date;
  final String driverName;
  final String carName;
  final String plateNumber;
  final double rating;
  final double price;
  final TripStatus status;

  const TripModel({
    required this.pickup,
    required this.dropOff,
    required this.date,
    required this.driverName,
    required this.carName,
    required this.plateNumber,
    required this.rating,
    required this.price,
    required this.status,
  });
}
