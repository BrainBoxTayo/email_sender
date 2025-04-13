import 'package:email_sender/common/styles/spacing_styles.dart';
import 'package:email_sender/features/signup/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const CustomLoginForm(),

              const SizedBox(height: CustomSizes.spaceBtwSections,),
              /// Divider
              const CustomFormDivider(dividerText: CustomTexts.orSignInWith,),

              const SizedBox(height: CustomSizes.spaceBtwItems,),

              const CustomSignInOptions()
            ],
          ),
        ),
      ),
    );
  }
}

