import 'package:lemo_app/features/nav_pages/services/data/models/service_item.dart';
import 'package:lemo_app/gen/assets.gen.dart';

final services = [
  ServiceItem(
    title: 'Airport Transportation',
    description: 'Reliable pickup from your services or any location.',
    icon: Assets.images.plane,
  ),
  ServiceItem(
    title: 'Long Distances',
    description: 'Comfortable transportation between cities.',
    icon: Assets.images.distance,
  ),
  ServiceItem(
    title: 'Daily Trips',
    description: 'Book a private driver and car.',
    icon: Assets.images.daily,
  ),
];
