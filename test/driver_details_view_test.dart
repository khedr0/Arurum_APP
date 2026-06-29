import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lemo_app/features/passenger/home/data/models/vehicle_model.dart';
import 'package:lemo_app/features/passenger/home/presentation/view/driver_details_view.dart';
import 'package:lemo_app/features/passenger/home/presentation/widgets/carousel_header.dart';
import 'package:lemo_app/features/passenger/home/presentation/widgets/driver_profile_header_card.dart';
import 'package:lemo_app/features/passenger/home/presentation/widgets/vehicle_features_card.dart';
import 'package:lemo_app/features/passenger/home/presentation/widgets/review_item_widget.dart';

void main() {
  final testVehicle = VehicleModel(
    image: 'assets/images/blackSedanRM.png',
    name: 'Toyota Camry',
    type: 'Luxury Sedan',
    driver: 'Mohamed Ahmed',
    rating: 4.8,
    plate: 'ABC-1234',
    price: 500.0,
    completedTrips: 150,
    carBrand: 'Toyota',
    year: '2025',
    color: 'Black',
  );

  testWidgets('DriverDetailsView renders details and controls correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) => DriverDetailsView(vehicle: testVehicle),
          ),
        ),
      ),
    );

    // Verify sub-widgets are rendered
    expect(find.byType(CarouselHeader), findsOneWidget);
    expect(find.byType(DriverProfileHeaderCard), findsOneWidget);
    expect(find.byType(VehicleFeaturesCard), findsOneWidget);
    expect(find.byType(ReviewItemWidget), findsAtLeastNWidgets(1));

    // Verify driver info is correct
    expect(find.text('Mohamed Ahmed'), findsOneWidget);
    expect(find.text('Professional Driver'), findsOneWidget);
    expect(find.text('500 LE'), findsOneWidget);
    expect(find.text('2 Hours 30 mins'), findsOneWidget);

    // Verify car specs are correct
    expect(find.text('Toyota Camry 2025'), findsOneWidget);
    expect(find.text('Luxury Sedan'), findsOneWidget);
    expect(find.text('ABC-1234'), findsOneWidget);

    // Verify badges are correct
    expect(find.text('AC'), findsOneWidget);
    expect(find.text('Chargers'), findsOneWidget);
    expect(find.text('Water'), findsOneWidget);

    // Verify buttons are correct
    expect(find.text('Cancel Trip'), findsOneWidget);
    expect(find.text('Accept Trip'), findsOneWidget);
  });
}
