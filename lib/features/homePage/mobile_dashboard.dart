import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:email_sender/utils/constants/colors.dart';

class MobileDashBoard extends StatelessWidget {
  const MobileDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomColors.primary, Color(0xFF0A1F23)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
           child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              constraints: BoxConstraints(minHeight: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                color: Colors.white,
              ),
              width: double.infinity,
            ),
            SizedBox(height: CustomSizes.spaceBtwSections),
            Container(
              constraints: BoxConstraints(minHeight: 300),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                  color: Colors.white,
                ),
                width: double.infinity,
              ),
            SizedBox(height: CustomSizes.spaceBtwSections),
            Container(
              constraints: BoxConstraints(minHeight: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                color: Colors.white,
              ),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
