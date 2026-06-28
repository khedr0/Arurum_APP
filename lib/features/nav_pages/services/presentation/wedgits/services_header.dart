import 'package:flutter/material.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class ServicesHeader extends StatelessWidget {
  const ServicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Rawan', style: AppTextStyles.join),
        const SizedBox(height: 6),
        Text(
          'We have 4 different home we provide, choose one from the following to help you book your ride easily.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
