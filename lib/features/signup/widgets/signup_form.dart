import 'package:email_sender/features/signup/controllers/signup/signup_controller.dart';
import 'package:email_sender/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:email_sender/features/signup/widgets/termsAndConditions.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/constants/text_strings.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        CustomValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CustomTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: CustomSizes.spaceBtwItems,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        CustomValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CustomTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  CustomValidator.validateEmptyText('User name', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: CustomTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),

            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => CustomValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: CustomTexts.email,
                  prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            //Phone Number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => CustomValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: CustomTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => CustomValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: CustomTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye)
                    )
                ),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            // Terms and Conditions CheckBox
            const CustomTextsAndConditions(),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            // Sign up Button

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.signup();
                  },
                  child: const Text(CustomTexts.createAccount),
                )
                ),
          ],
        ));
  }
}
