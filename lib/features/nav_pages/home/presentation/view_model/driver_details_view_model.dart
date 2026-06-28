import 'package:flutter/material.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/review_model.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';

class DriverDetailsViewModel extends ChangeNotifier {
  final VehicleModel vehicle;
  int _currentImageIndex = 0;

  DriverDetailsViewModel({required this.vehicle});

  int get currentImageIndex => _currentImageIndex;

  List<ReviewModel> get reviews => const [
    ReviewModel(
      reviewerName: 'Rawan Shawky',
      date: 'May 2, 2026',
      rating: 5.0,
      reviewText:
          'Marcus was incredibly professional and punctual. The car was immaculate and the ride was very smooth. Highly recommend for airport transfers.',
    ),
    ReviewModel(
      reviewerName: 'Rawan Shawky',
      date: 'May 2, 2026',
      rating: 5.0,
      reviewText:
          'Marcus was incredibly professional and punctual. The car was immaculate and the ride was very smooth. Highly recommend for airport transfers.',
    ),
    ReviewModel(
      reviewerName: 'Rawan Shawky',
      date: 'May 2, 2026',
      rating: 5.0,
      reviewText:
          'Marcus was incredibly professional and punctual. The car was immaculate and the ride was very smooth. Highly recommend for airport transfers.',
    ),
  ];

  void acceptTrip(BuildContext context) {
    // Actions for accepting the trip, like showing a snackbar and navigating back
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Trip accepted with ${vehicle.driver}!'),
      ),
    );
    Navigator.of(context).pop();
  }

  void cancelTrip(BuildContext context) {
    // Navigate back when trip is cancelled
    Navigator.of(context).pop();
  }
}
