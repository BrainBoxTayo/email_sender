import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DesktopDashBoard extends StatelessWidget {
  const DesktopDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: CustomSizes.spaceBtwSections),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                  color: Colors.white,
                ),
                height: 300,
              ),
            ),
            SizedBox(width: CustomSizes.spaceBtwSections),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                  color: Colors.white,
                ),
                height: 300,
              ),
            ),
          ],
        ),
        SizedBox(height: CustomSizes.spaceBtwSections),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 400,
        ),
        SizedBox(height: CustomSizes.spaceBtwSections),
      ],
    );
  }
}
