import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';
import 'package:lemo_app/features/auth/presentation/wedgits/auth_text_field.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  bool obscureCurrent = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row: Back button and Title
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.pop(),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            width: 44.w,
                            height: 44.w,
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: AppColors.divider,
                                width: 1.5,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 16.w,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          'Change Password',
                          style: AppTextStyles.bold20.copyWith(fontSize: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // Description text
                    Text(
                      'Password should be at least 8 digits',
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Current Password Field
                    AuthTextField(
                      controller: currentPasswordController,
                      label: '',
                      hint: 'Current Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      suffixIcon: obscureCurrent
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      isPassword: obscureCurrent,
                      onSuffixPressed: () {
                        setState(() {
                          obscureCurrent = !obscureCurrent;
                        });
                      },
                    ),
                    SizedBox(height: 12.h),

                    // New Password Field
                    AuthTextField(
                      controller: newPasswordController,
                      label: '',
                      hint: 'New Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      suffixIcon: obscureNew
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      isPassword: obscureNew,
                      onSuffixPressed: () {
                        setState(() {
                          obscureNew = !obscureNew;
                        });
                      },
                    ),
                    SizedBox(height: 12.h),

                    // Confirm New Password Field
                    AuthTextField(
                      controller: confirmNewPasswordController,
                      label: '',
                      hint: 'Confirm New Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      suffixIcon: obscureConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      isPassword: obscureConfirm,
                      onSuffixPressed: () {
                        setState(() {
                          obscureConfirm = !obscureConfirm;
                        });
                      },
                    ),
                    SizedBox(height: 8.h),

                    // "Forget Password" Action Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Handle forget password redirection/action
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            'Forget Password',
                            style: AppTextStyles.medium14.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // "Save" Button at the bottom
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
              child: CustomButton(
                text: 'Save',
                height: 50.h,
                borderRadius: 24.r,
                textStyle: AppTextStyles.medium16.copyWith(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password updated successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
