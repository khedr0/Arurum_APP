import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/widgets/luxury_stat_item.dart';

class LuxuryStatsBar extends StatelessWidget {
  final int newRequests;
  final int scheduledTrips;
  final double todaysEarnings;

  const LuxuryStatsBar({
    super.key,
    required this.newRequests,
    required this.scheduledTrips,
    required this.todaysEarnings,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LuxuryStatItem(
            title: 'REQUESTS',
            value: newRequests.toString(),
            isHighlighted: newRequests > 0,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: LuxuryStatItem(
            title: 'SCHEDULED',
            value: scheduledTrips.toString(),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: LuxuryStatItem(
            title: 'EARNINGS TODAY',
            value: '${todaysEarnings.toInt()} LE',
          ),
        ),
      ],
    );
  }
}
