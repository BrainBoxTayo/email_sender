import 'package:email_sender/common/widgets/buttons/animated_button_controller.dart';
import 'package:email_sender/features/signup/controllers/signup/microsoft_signup_controller.dart';
import 'package:email_sender/features/signup/signInPage.dart';
import 'package:email_sender/features/signup/widgets/login_widgets.dart';
import 'package:email_sender/features/signup/widgets/signup_form.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/constants/text_strings.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  
  final MicrosoftSignupController signUpController = Get.put(MicrosoftSignupController());
  final ButtonStateController buttonAnimationController = Get.put(ButtonStateController());
  @override
  Widget build(BuildContext context) {
    CustomHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.primary, Color(0xFF0A1F23)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                //Title
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(CustomTexts.signupTitle,
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white)),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
          
                  //Form
                  Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(24),
                        child: const CustomSignUpForm(),
                      ),
                  
                  const SizedBox(height: CustomSizes.spaceBtwSections,),
                  const CustomFormDivider(dividerText: CustomTexts.orSignUpWith,),
                  const SizedBox(height: CustomSizes.spaceBtwSections,),
                  AnimatedMsAuthButton(signInController: signUpController, buttonAnimationController: buttonAnimationController,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

