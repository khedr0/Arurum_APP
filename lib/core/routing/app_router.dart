import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/navigation/main_navigation_view.dart';
import 'package:lemo_app/features/auth/presentation/view/log_in_view.dart';
import 'package:lemo_app/features/auth/presentation/view/otp_view.dart';
import 'package:lemo_app/features/auth/presentation/view/register_view.dart';
import 'package:lemo_app/features/nav_pages/home/data/models/vehicle_model.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/view/available_drivers_view.dart';
import 'package:lemo_app/features/nav_pages/home/presentation/view/driver_details_view.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/view/change_password_view.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/view/personal_info_view.dart';
import 'package:lemo_app/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:lemo_app/features/role/presentation/view/role_view.dart';


import 'route_paths.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.onboarding,

    routes: [

      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: RoutePaths.role,
        builder: (context, state) => const RoleView(),
      ),

      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(path: '/main', builder: (_, __) => const MainNavigationView()),
      GoRoute(
        path: RoutePaths.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: RoutePaths.otp,
        builder: (context, state) => const OtpView(),
      ),
      GoRoute(
        path: RoutePaths.personalInfo,
        builder: (context, state) => const PersonalInfoView(),
      ),
      GoRoute(
        path: RoutePaths.changePassword,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: RoutePaths.rideDetails,
        builder: (context, state) {
          final extra = state.extra as Map<String, String>?;
          return AvailableDriversView(
            pickUpLocation: extra?['pickUp'] ?? 'Borg Al Arab Airport',
            dropOffLocation: extra?['dropOff'] ?? 'Destination',
            selectedClass: extra?['selectedClass'] ?? 'Economy',
          );
        },
      ),
      GoRoute(
        path: RoutePaths.driverDetails,
        builder: (context, state) {
          final vehicle = state.extra as VehicleModel;
          return DriverDetailsView(vehicle: vehicle);
        },
      ),
    ],
  );
}
