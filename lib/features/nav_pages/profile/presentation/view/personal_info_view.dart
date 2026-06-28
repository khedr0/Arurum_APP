import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lemo_app/core/theme/app_colors.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';
import 'package:lemo_app/core/widgets/date_field.dart';
import 'package:lemo_app/features/auth/presentation/wedgits/auth_text_field.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final birthdayController = TextEditingController();
  final cityController = TextEditingController();
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    // Prefill data from screenshot/defaults
    firstNameController.text = 'Rawan';
    lastNameController.text = 'Shawky';
    emailController.text = 'Rshaawky@gmail.com';
    phoneController.text = '0103222222';
    cityController.text = 'Alexandria';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      behavior: HitTestBehavior.opaque,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            size: 14.w,
                            color: AppColors.textPrimary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Settings',
                            style: AppTextStyles.regular14.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Personal Information',
                      style: AppTextStyles.bold20.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: AuthTextField(
                            controller: firstNameController,
                            label: 'First Name',
                            hint: 'Rawan',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: AuthTextField(
                            controller: lastNameController,
                            label: 'Last Name',
                            hint: 'Shawky',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    // Email Field
                    AuthTextField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Rshaawky@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 12.h),

                    // Phone Number Field
                    AuthTextField(
                      controller: phoneController,
                      label: 'Phone Number',
                      hint: '0103222222',
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: DateField(
                            controller: birthdayController,
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                                initialDate: DateTime.now(),
                              );

                              if (date != null) {
                                birthdayController.text = DateFormat(
                                  'dd/MM/yyyy',
                                ).format(date);
                              }
                            },
                            title: 'Birthday',
                            hintText: 'dd/mm/yyyy',
                            suffixIcon: Icons.calendar_month_outlined,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: AppTextStyles.regular14.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              DropdownButtonFormField<String>(
                                initialValue: selectedGender,
                                decoration: InputDecoration(
                                  hintText: 'Gender',
                                  hintStyle: AppTextStyles.regular12.copyWith(
                                    fontSize: 12.sp,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.wc_rounded,
                                    color: AppColors.textSecondary,
                                    size: 18.w,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 12.h,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.textSecondary,
                                  size: 20.w,
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Female',
                                    child: Text('Female'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Male',
                                    child: Text('Male'),
                                  ),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    selectedGender = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    // City Field
                    AuthTextField(
                      controller: cityController,
                      label: 'City',
                      hint: 'Alexandria',
                    ),
                    SizedBox(height: 60.h),
                    CustomButton(
                      text: 'Save Changes',
                      height: 50.h,
                      textStyle: AppTextStyles.medium16.copyWith(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Changes saved successfully!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
