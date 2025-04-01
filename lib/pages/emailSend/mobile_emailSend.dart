import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:email_sender/utils/constants/colors.dart';

class MobileEmailSend extends StatelessWidget {
  const MobileEmailSend({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                color: Colors.white,
              ),
              width: double.infinity,
            ),
          ),
          SizedBox(height: CustomSizes.spaceBtwSections),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                color: Colors.white,
              ),
              width: double.infinity,
            ),
          ),
          SizedBox(height: CustomSizes.spaceBtwSections),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                color: Colors.white,
              ),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
