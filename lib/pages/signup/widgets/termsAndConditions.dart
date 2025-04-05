// ignore: file_names
import 'package:email_sender/pages/signup/controllers/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/constants/text_strings.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CustomTextsAndConditions extends StatelessWidget {
  const CustomTextsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final bool dark = CustomHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.checkTermsAndConditions.value,
                onChanged: (value) => controller.checkTermsAndConditions.value = !controller.checkTermsAndConditions.value)
            )
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '${CustomTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${CustomTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CustomColors.white : CustomColors.primary,
                    )),
            TextSpan(
                text: '${CustomTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${CustomTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CustomColors.white : CustomColors.primary,
                    )),
          ])),
        )
      ],
    );
  }
}
