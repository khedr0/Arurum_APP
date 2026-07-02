import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/features/passenger/presentation/view/passenger_main_navigation_view.dart';
import 'package:lemo_app/features/chauffeur/presentation/view/driver_main_navigation_view.dart';
import 'package:lemo_app/features/auth/presentation/view/chauffeur_register_view.dart';
import 'package:lemo_app/features/auth/presentation/view/log_in_view.dart';
import 'package:lemo_app/features/auth/presentation/view/otp_view.dart';
import 'package:lemo_app/features/auth/presentation/view/passenger_register_view.dart';
import 'package:lemo_app/features/auth/presentation/view/role_selection_view.dart';
import 'package:lemo_app/features/passenger/home/data/models/vehicle_model.dart';
import 'package:lemo_app/features/passenger/home/presentation/view/available_drivers_view.dart';
import 'package:lemo_app/features/passenger/home/presentation/view/driver_details_view.dart';
import 'package:lemo_app/features/passenger/profile/presentation/view/change_password_view.dart';
import 'package:lemo_app/features/passenger/profile/presentation/view/personal_info_view.dart';
import 'package:lemo_app/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:lemo_app/features/chauffeur/presentation/navigation/views/navigation_view.dart';
import 'package:lemo_app/features/chauffeur/presentation/driver_home/models/active_trip_model.dart';

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

      // GoRoute(
      //   path: RoutePaths.role,
      //   builder: (context, state) => const RoleView(),
      // ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RoutePaths.roleSelection,
        builder: (context, state) => const RoleSelectionView(),
      ),
      GoRoute(path: RoutePaths.passengerMain, builder: (_, __) => const PassengerMainNavigation()),
      GoRoute(path: RoutePaths.driverMain, builder: (_, __) => const DriverMainNavigation()),
      GoRoute(
        path: RoutePaths.passengerRegister,
        builder: (context, state) => const PassengerRegisterView(),
      ),
      GoRoute(
        path: RoutePaths.chauffeurRegister,
        builder: (context, state) => const ChauffeurRegisterView(),
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
      GoRoute(
        path: RoutePaths.driverNavigation,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final activeTrip = extra?['trip'] as ActiveTripModel?;
          final onArrive = extra?['onArrive'] as VoidCallback?;
          final onComplete = extra?['onComplete'] as VoidCallback?;
          return NavigationView(
            activeTrip: activeTrip!,
            onArrive: onArrive,
            onComplete: onComplete,
          );
        },
      ),
    ],
  );
}
