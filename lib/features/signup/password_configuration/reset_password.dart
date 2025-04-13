import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/constants/text_strings.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key,});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        clipBehavior: Clip.none,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAllNamed(CustomRoutes.loginScreen), icon: const Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Image??
                    Image(image: const AssetImage(CustomImages.deliveredEmailIllustration), width: CustomHelperFunctions.screenWidth() * 0.2,),
                    const SizedBox(height: CustomSizes.spaceBtwSections,),
                    
                    /// Title and Subtitle
                    Text(CustomTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                    const SizedBox(height: CustomSizes.spaceBtwItems,),
                    Text(CustomTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                    const SizedBox(height: CustomSizes.spaceBtwSections,),
            
                    /// Buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () => Get.offAllNamed(CustomRoutes.loginScreen), child: const Text(CustomTexts.done)),
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwSections,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {}, child: const Text(CustomTexts.tContinue)),
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
