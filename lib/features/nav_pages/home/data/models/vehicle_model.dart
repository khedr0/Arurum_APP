class VehicleModel {
  final String image;
  final String name;
  final String type;
  final String driver;
  final double rating;
  final String plate;
  final double price;
  final int completedTrips;
  final String carBrand;
  final String year;
  final String color;

  const VehicleModel({
    required this.image,
    required this.name,
    required this.type,
    required this.driver,
    required this.rating,
    required this.plate,
    required this.price,
    this.completedTrips = 0,
    this.carBrand = '',
    this.year = '',
    this.color = '',
  });
}
