import 'package:email_sender/common/success_screen/success_screen.dart';
import 'package:email_sender/pages/signup/login.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/text_strings.dart';

import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAllNamed(CustomRoutes.loginScreen),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
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
                CustomTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(
                'teetayotemi23@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(
                CustomTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(CustomRoutes.dashboard),
                  child: const Text(CustomTexts.tContinue),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(CustomTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
