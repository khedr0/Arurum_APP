import 'package:flutter/material.dart';
import 'package:lemo_app/core/navigation/wedgits/main_bottom_nav_bar.dart';
import 'package:lemo_app/features/nav_pages/activity/presentation/view/activity_view.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/view/home_view.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/view/profile_view.dart';
import 'package:lemo_app/features/nav_pages/services/presentation/view/service_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int currentIndex = 0;

  late final List<Widget> pages = [
    const HomeView(),
    const ServicesView(),
    const ActivityView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
