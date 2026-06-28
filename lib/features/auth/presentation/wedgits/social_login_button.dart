import 'package:flutter/material.dart';
import 'package:lemo_app/core/theme/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const SocialLoginButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
