import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/view/profile_view.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/widgets/profile_header.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/widgets/profile_stat_card.dart';
import 'package:lemo_app/features/nav_pages/profile/presentation/widgets/logout_button.dart';

void main() {
  testWidgets('ProfileView renders all profile sections and stats correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, child) => const ProfileView(),
          ),
        ),
      ),
    );

    // Verify ProfileHeader elements
    expect(find.byType(ProfileHeader), findsOneWidget);
    expect(find.text('Rawan Shawky'), findsOneWidget);
    expect(find.text('rshawky@gmail.com'), findsOneWidget);
    expect(find.text('4.8'), findsOneWidget);
    expect(find.text('VIP Member'), findsOneWidget);

    // Verify ProfileStatCard items
    expect(find.byType(ProfileStatCard), findsNWidgets(3));
    expect(find.text('Total Trips'), findsOneWidget);
    expect(find.text('Total Spent'), findsOneWidget);
    expect(find.text('Points'), findsOneWidget);
    expect(find.text('25'), findsOneWidget);
    expect(find.text('1500 LE'), findsOneWidget);
    expect(find.text('450'), findsOneWidget);

    // Verify ProfileMenuCard section titles
    expect(find.text('Account Settings'), findsOneWidget);
    expect(find.text('Preferences'), findsOneWidget);
    expect(find.text('Support'), findsOneWidget);

    // Verify menu items
    expect(find.text('Personal Information'), findsOneWidget);
    expect(find.text('Change Password'), findsOneWidget);
    expect(find.text('Saved Addresses'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Privacy and Security'), findsOneWidget);
    expect(find.text('Help Center'), findsOneWidget);
    expect(find.text('Contact Support'), findsOneWidget);
    expect(find.text('Terms & Conditions'), findsOneWidget);

    // Verify LogoutButton elements
    expect(find.byType(LogoutButton), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });
}
