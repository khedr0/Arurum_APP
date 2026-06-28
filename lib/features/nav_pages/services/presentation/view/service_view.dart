import 'package:flutter/material.dart';
import 'package:lemo_app/core/theme/app_text_style.dart';
import 'package:lemo_app/core/widgets/custom_button.dart';
import 'package:lemo_app/features/nav_pages/services/presentation/wedgits/service_list.dart';
import 'package:lemo_app/features/nav_pages/services/presentation/wedgits/services_header.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * .1),

            const ServicesHeader(),

            SizedBox(height: height * .04),

            Text('Trip Services', style: AppTextStyles.medium16),

            SizedBox(height: height * .02),

            Expanded(
              child: ServiceList(
                selectedIndex: selectedIndex,
                onChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),

            CustomButton(text: 'Continue', onPressed: () {}),

            SizedBox(height: height * .07),
          ],
        ),
      ),
    );
  }
}
