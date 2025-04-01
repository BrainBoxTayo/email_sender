import 'package:email_sender/common/widgets/buttons/animated_sign_in.dart' show ButtonStateController;
import 'package:email_sender/pages/sign_in/authentication/controllers/signup/signup_controller.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final signInController = Get.put(SignupController());
  final buttonAnimationController = Get.put(ButtonStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.primary, Color(0xFF0A1F23)], // Blue gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome Text
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Animated Microsoft Sign-In Button
            MouseRegion(
              onEnter: (_) => buttonAnimationController.changeHoverState(),
              onExit: (_) => buttonAnimationController.changeHoverState(),
              child: Obx(() {
                final transform = buttonAnimationController.isHovered.value
                    ? (Matrix4.identity()..scale(1.1))
                    : Matrix4.identity();

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: transform,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      buttonAnimationController.changeHoverState(); // Temporarily prevent further clicks
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
            ),
          ],
        ),
      ),
    );
  }
}
