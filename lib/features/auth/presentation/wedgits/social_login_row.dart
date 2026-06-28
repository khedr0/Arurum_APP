import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/routing/route_paths.dart';

import 'social_login_button.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Or Log in with'),
            ),
            Expanded(child: Divider()),
          ],
        ),

        Row(
          children: [
            SocialLoginButton(
              onTap: () {
                (context).push(RoutePaths.register);
              },
              icon: const Icon(Icons.g_mobiledata),
            ),

            const SizedBox(width: 12),

            SocialLoginButton(onTap: () {}, icon: const Icon(Icons.apple)),

            const SizedBox(width: 12),

            SocialLoginButton(onTap: () {}, icon: const Icon(Icons.facebook)),
          ],
        ),
      ],
    );
  }
}
