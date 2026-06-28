import 'package:flutter/material.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class AuthLogoSection extends StatelessWidget {
  const AuthLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text('Aurum', style: AppTextStyles.join)]);
  }
}
