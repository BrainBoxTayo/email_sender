import 'package:email_sender/pages/signup/password_configuration/forgot_password.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:email_sender/pages/signup/signup.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

/// SIGN IN OPTIONS
class CustomSignInOptions extends StatelessWidget {
  const CustomSignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: CustomSizes.iconMd,
              width: CustomSizes.iconMd,
              image: AssetImage(CustomImages.google),
            ),
          ),
        ),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: CustomSizes.iconMd,
              width: CustomSizes.iconMd,
              image: AssetImage(CustomImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}

/// Custom FORM DIVIDER
class CustomFormDivider extends StatelessWidget {
  final String dividerText;

  const CustomFormDivider({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? CustomColors.white : CustomColors.white,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.apply(color: Colors.white),
        ),
        Flexible(
          child: Divider(
            color: dark ? CustomColors.darkGrey : CustomColors.grey,
            thickness: .5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}

/// LOGIN FORM
class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Field
          Text('Email', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: CustomSizes.spaceBtwItems / 2),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.direct_right),
              hintText: 'Enter your email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                borderSide: const BorderSide(color: CustomColors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                borderSide: const BorderSide(color: CustomColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                borderSide: const BorderSide(color: CustomColors.primary),
              ),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),

          // Password Field
          Text('Password', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: CustomSizes.spaceBtwItems / 2),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon: const Icon(Iconsax.eye_slash),
                onPressed: () {},
              ),
              hintText: 'Enter your password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                borderSide: const BorderSide(color: CustomColors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                borderSide: const BorderSide(color: CustomColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                borderSide: const BorderSide(color: CustomColors.primary),
              ),
            ),
          ),

          // Remember Me & Forgot Password
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Text(
                    CustomTexts.rememberMe,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              TextButton(
                onPressed: () => Get.toNamed(CustomRoutes.forgotPassword),
                child: Text(
                  CustomTexts.forgetPassword,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.apply(color: CustomColors.primary),
                ),
              ),
            ],
          ),

          // Sign In Button
          const SizedBox(height: CustomSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                ),
              ),
              child: const Text(CustomTexts.signIn),
            ),
          ),

          // Create Account Button
          const SizedBox(height: CustomSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.toNamed(CustomRoutes.signupScreen),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
                ),
                side: const BorderSide(color: CustomColors.primary),
              ),
              child: Text(
                CustomTexts.createAccount,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.apply(color: CustomColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
