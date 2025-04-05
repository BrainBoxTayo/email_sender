
import 'package:email_sender/common/widgets/buttons/animated_button_controller.dart'
    show ButtonStateController;
import 'package:email_sender/pages/signup/controllers/controllers/signup/microsoft_signup_controller.dart';
import 'package:email_sender/pages/signup/widgets/login_widgets.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final signInController = Get.put(MicrosoftSignupController());
  final buttonAnimationController = Get.put(ButtonStateController());

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome Text
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Sign in to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Login Form Container
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
                    child: const CustomLoginForm(),
                  ),

                  const SizedBox(height: 32),

                  // Divider
                  const CustomFormDivider(
                    dividerText: "OR",
                  ),

                  const SizedBox(height: 24),

                  // Microsoft Sign-In Button
                  AnimatedMsAuthButton(
                    buttonAnimationController: buttonAnimationController,
                    signInController: signInController,
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

class AnimatedMsAuthButton extends StatelessWidget {
  const AnimatedMsAuthButton({
    super.key,
    required this.buttonAnimationController,
    required this.signInController,
  });

  final ButtonStateController buttonAnimationController;
  final MicrosoftSignupController signInController;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => buttonAnimationController.changeHoverState(),
      onExit: (_) => buttonAnimationController.changeHoverState(),
      child: Obx(() {
        final transform =
            buttonAnimationController.isHovered.value
                ? (Matrix4.identity()..scale(1.1))
                : Matrix4.identity();

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: OutlinedButton.icon(
            onPressed: () async {
              buttonAnimationController
                  .changeHoverState(); // Temporarily prevent further clicks
              final userCredential = await signInController.signUp();

              if (userCredential != null) {
                // Navigate to the next page after successful sign-in
                Get.offAllNamed(CustomRoutes.dashboard); // Or any other route
              } else {
                // Handle sign-in failure (e.g., show error)
                Get.snackbar('Sign-in Failed', 'Please try again later.');
              }
            },
            icon: const Icon(
              FontAwesomeIcons.microsoft,
              color: Colors.blueAccent,
              size: 24,
            ),
            label: const Text(
              "Sign In with Microsoft",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: CustomColors.primary,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
              side: const BorderSide(color: Colors.black26, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.white,
              shadowColor: Colors.black26,
              elevation: 8,
            ),
          ),
        );
      }),
    );
  }
}
