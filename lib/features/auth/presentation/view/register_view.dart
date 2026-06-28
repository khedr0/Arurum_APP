import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lemo_app/core/routing/route_paths.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/date_field.dart';
import 'package:lemo_app/features/auth/presentation/wedgits/auth_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final birthdayController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  (context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),

              const SizedBox(height: 6),

              Text('Create Account', style: AppTextStyles.bold20),

              const SizedBox(height: 4),

              Text(
                'Book your next trip with ease.',
                style: AppTextStyles.regular14,
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      controller: firstNameController,
                      label: 'First Name',
                      hint: 'first name',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AuthTextField(
                      controller: lastNameController,
                      label: 'Last Name',
                      hint: 'last name',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              AuthTextField(
                controller: emailController,
                label: 'Email',
                hint: 'example@gmail.com',
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      controller: passwordController,
                      label: 'Password',
                      hint: '************',
                      isPassword: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AuthTextField(
                      controller: confirmPasswordController,
                      label: 'Confirm Password',
                      hint: '************',
                      isPassword: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      controller: phoneController,
                      label: 'Phone Number',
                      hint: '+02 ',
                    ),
                  ),
                  const SizedBox(width: 12),
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
                ],
              ),

              const SizedBox(height: 10),

              AuthTextField(
                controller: addressController,
                label: 'Street Address',
                hint: '123 Main St',
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Expanded(
                    child: AuthTextField(label: 'City', hint: 'Alexandria'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender', style: AppTextStyles.regular14),
                        const SizedBox(height: 4),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'female',
                              child: Text('Female'),
                            ),
                            DropdownMenuItem(
                              value: 'male',
                              child: Text('Male'),
                            ),
                          ],
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms of Conditions and Privacy Policy',
                            style: AppTextStyles.medium14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    (context).push(RoutePaths.otp);
                  },
                  child: const Text('Sign Up'),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.regular14,
                    children: [
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(text: 'Sign in', style: AppTextStyles.medium14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
