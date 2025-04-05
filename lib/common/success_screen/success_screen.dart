
import 'package:email_sender/common/styles/spacing_styles.dart';
import 'package:email_sender/pages/signup/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(CustomImages.deliveredEmailIllustration),
                width: CustomHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              // Title & Subtitle
              Text(
                CustomTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(
                CustomTexts.yourAccountCreatedSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text("Success"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
