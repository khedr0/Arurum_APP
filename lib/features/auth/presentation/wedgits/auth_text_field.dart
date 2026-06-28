import 'package:flutter/material.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onSuffixPressed;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    this.onSuffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: AppTextStyles.regular14),
          const SizedBox(height: 4),
        ],
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.regular12,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null
                ? (onSuffixPressed != null
                      ? IconButton(
                          icon: Icon(suffixIcon),
                          onPressed: onSuffixPressed,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        )
                      : Icon(suffixIcon))
                : null,
          ),
        ),
      ],
    );
  }
}
