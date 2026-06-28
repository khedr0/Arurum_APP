import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/routing/route_paths.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/features/on_boarding/presentation/widgets/custom_button.dart';
import 'package:lemo_app/gen/assets.gen.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': Assets.images.bkchufier.path,
      'title': 'Comfort\nRedefined',
      'description':
          'Relax in premium comfort with spacious\nseating and refined interiors.',
    },
    {
      'image': Assets.images.onboarding22.path,
      'title': 'Travel Without\nCompromise',
      'description':
          'Chauffeur-driven vehicles for those who\nvalue time and privacy.',
    },
    {
      'image': Assets.images.onboarding33.path,
      'title': 'Professional\nChauffeurs',
      'description':
          'Experienced, discreet, and dedicated to\nproviding a safe and smooth journey.',
    },
  ];

  void _onNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutQuad,
      );
    } else {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    context.go(RoutePaths.role);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background Images and Content PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              final item = _onboardingData[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(item['image'] ?? '', fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.8),
                          Colors.black,
                        ],
                        stops: const [0.0, 0.5, 0.75, 1.0],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            item['title'] ?? '',
                            style: AppTextStyles.join.copyWith(
                              fontSize: 28.sp,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.normal,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            item['description'] ?? '',
                            style: AppTextStyles.regular14.copyWith(
                              color: Colors.grey.shade400,
                              height: 1.5,
                            ),
                          ),
                          // Provide space for indicators and button
                          SizedBox(height: 120.h),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          SafeArea(
            child: Column(
              children: [
                // Top Bar with Skip Button
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h.clamp(6.0, 16.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _navigateToHome,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                      ),
                      child: Text('Skip', style: AppTextStyles.bold16),
                    ),
                  ),
                ),

                const Spacer(),

                // Fixed Bottom Area: Indicators & Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          _onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.only(right: 6.w),
                            width: _currentPage == index ? 24.w : 6.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? AppColors.primary
                                  : Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Action Button
                      GestureDetector(
                        onTap: _onNextPage,
                        child: CustomButton(
                          currentPage: _currentPage,
                          onboardingData: _onboardingData,
                        ),
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
