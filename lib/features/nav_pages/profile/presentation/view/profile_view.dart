import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/routing/route_paths.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/widgets/logout_button.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/widgets/profile_header.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/widgets/profile_menu_card.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/widgets/profile_stat_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const ProfileHeader(),

              // Stats & Menu Sections
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stats Row
                    Row(
                      children: [
                        const Expanded(
                          child: ProfileStatCard(
                            value: '25',
                            label: 'Total Trips',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        const Expanded(
                          child: ProfileStatCard(
                            value: '1500 LE',
                            label: 'Total Spent',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        const Expanded(
                          child: ProfileStatCard(value: '450', label: 'Points'),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // Account Settings
                    Text(
                      'Account Settings',
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ProfileMenuCard(
                      items: [
                        ProfileMenuItem(
                          icon: Icons.person,
                          title: 'Personal Information',
                          onTap: () {
                            context.push(RoutePaths.personalInfo);
                          },
                        ),
                        ProfileMenuItem(
                          icon: Icons.lock,
                          title: 'Change Password',
                          onTap: () {
                            context.push(RoutePaths.changePassword);
                          },
                        ),
                        ProfileMenuItem(
                          icon: Icons.location_on,
                          title: 'Saved Addresses',
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // Preferences
                    Text(
                      'Preferences',
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ProfileMenuCard(
                      items: [
                        ProfileMenuItem(
                          icon: Icons.notifications,
                          title: 'Notifications',
                          trailing: SizedBox(
                            width: 48.w,
                            height: 28.h,
                            child: Switch(
                              value: _notificationsEnabled,
                              onChanged: (value) {
                                setState(() {
                                  _notificationsEnabled = value;
                                });
                              },
                              activeColor: AppColors.black,
                              activeTrackColor: AppColors.primary,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ProfileMenuItem(
                          icon: Icons.language,
                          title: 'Language',
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'English',
                                style: AppTextStyles.regular14.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.textSecondary,
                                size: 20.w,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                        ProfileMenuItem(
                          icon: Icons.security,
                          title: 'Privacy and Security',
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // Support
                    Text(
                      'Support',
                      style: AppTextStyles.bold16.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ProfileMenuCard(
                      items: [
                        ProfileMenuItem(
                          icon: Icons.help,
                          title: 'Help Center',
                          onTap: () {},
                        ),
                        ProfileMenuItem(
                          icon: Icons.headset_mic_rounded,
                          title: 'Contact Support',
                          onTap: () {},
                        ),
                        ProfileMenuItem(
                          icon: Icons.article_rounded,
                          title: 'Terms & Conditions',
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: 32.h),

                    // Logout Button
                    LogoutButton(onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
