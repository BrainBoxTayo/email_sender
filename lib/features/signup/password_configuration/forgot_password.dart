import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(CustomTexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: CustomSizes.spaceBtwItems,
                ),
                Text(CustomTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(
                  height: CustomSizes.spaceBtwItems * 2,
                ),
          
                /// Text Field
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: CustomTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                  
                ),
          
                SizedBox(
                  height: CustomSizes.spaceBtwItems * 2,
                ),
          
                /// Submit Email Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {Get.offNamed(CustomRoutes.resetPassword);}, child: const Text(CustomTexts.submit))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
