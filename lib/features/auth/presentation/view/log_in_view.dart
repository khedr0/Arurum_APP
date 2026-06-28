import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/routing/route_paths.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';
import 'package:lemo_app/features/auth/presentation/wedgits/auth_logo_section.dart';
import 'package:lemo_app/features/auth/presentation/wedgits/auth_text_field.dart';
import 'package:lemo_app/features/auth/presentation/wedgits/social_login_row.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 50.h),

              const AuthLogoSection(),

              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Welcome Back', style: AppTextStyles.bold20),
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in to start booking your rides!',
                  style: AppTextStyles.regular14,
                ),
              ),

              const SizedBox(height: 32),

              const AuthTextField(
                label: 'Email Address',
                hint: 'name@gmail.com',
                prefixIcon: Icons.email_outlined,
              ),

              const SizedBox(height: 20),

              const AuthTextField(
                label: 'Password',
                hint: 'Enter your password',
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
                isPassword: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget password?',
                    style: AppTextStyles.medium14,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  (context).push(RoutePaths.main);
                },
              ),

              const SizedBox(height: 32),

              const SocialLoginRow(),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      (context).push(RoutePaths.register);
                    },
                    child: GestureDetector(
                      child: Text(
                        'Create an account',
                        style: AppTextStyles.bold16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
