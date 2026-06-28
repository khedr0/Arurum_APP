import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/routing/route_paths.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/role/presentation/wedgits/role_list_tile.dart';
import 'package:lemo_app/gen/assets.gen.dart';

class RoleViewContent extends StatelessWidget {
  const RoleViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.images.roleBackground.path,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 16),
                            Text("Join Lemo", style: AppTextStyles.join),
                            const SizedBox(height: 8),
                            Text(
                              "Select your role to get started",
                              style: AppTextStyles.regular14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RoleListTile(
                        icon: Icons.person,
                        title: 'Passenger',
                        subtitle: 'Book airport pick ups and daily trips.',
                        onTap: () {
                          context.go(RoutePaths.login);
                        },
                        iconColor: AppColors.iconColor,
                        backgroundColor: AppColors.inputBackground,
                      ),
                      RoleListTile(
                        icon: Icons.directions_car_filled,
                        title: 'Driver',
                        subtitle: 'Driver clients and earn money.',
                        onTap: () {},
                        iconColor: AppColors.iconColor,
                        backgroundColor: AppColors.inputBackground,
                      ),
                    ],
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
