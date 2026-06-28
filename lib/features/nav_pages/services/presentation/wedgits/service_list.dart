import 'package:flutter/material.dart';
import 'package:lemo_app/features/nav_pages/services/data/service_data.dart';
import 'package:lemo_app/features/nav_pages/services/presentation/wedgits/service_card.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: services.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return ServiceCard(
            service: services[index],
            isSelected: selectedIndex == index,
            onTap: () => onChanged(index),
          );
        },
      ),
    );
  }
}
