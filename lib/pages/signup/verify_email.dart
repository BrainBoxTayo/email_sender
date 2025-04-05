import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/pages/signup/controllers/signup/verify_email_controller.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/text_strings.dart';

import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key});

  
  final email = Get.arguments['email'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        clipBehavior: Clip.none,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.signOut(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: CustomHelperFunctions.screenWidth() * 0.4,
            ),
            child: Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                children: [
                  // Image
                  Image(
                    image: const AssetImage(
                      CustomImages.deliveredEmailIllustration,
                    ),
                    width: CustomHelperFunctions.screenWidth() * 0.2,
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
                    email,
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
                      onPressed: () => controller.checkEmailVerified(),
                      child: const Text(CustomTexts.tContinue),
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
                      child: const Text(CustomTexts.resendEmail),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
