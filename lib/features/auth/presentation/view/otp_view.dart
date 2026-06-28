import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';
import 'package:lemo_app/features/auth/presentation/wedgits/auth_text_field.dart';
import 'package:lemo_app/gen/assets.gen.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),

              const SizedBox(height: 24),

              Text('Confirm Your Email', style: AppTextStyles.bold20),

              const SizedBox(height: 12),

              Text(
                'Please enter the code sent',
                style: AppTextStyles.regular14,
              ),

              const SizedBox(height: 4),

              Text('to user22@gmail.com', style: AppTextStyles.medium14),

              const SizedBox(height: 40),

              SvgPicture.asset(
                Assets.images.authenticationBro,
                height: 220,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 25),

              AuthTextField(
                controller: otpController,
                label: '',
                hint: 'Enter OTP',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),

              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  style: AppTextStyles.medium14.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              CustomButton(
                text: 'Continue',
                onPressed: () {
                  debugPrint(otpController.text);
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
