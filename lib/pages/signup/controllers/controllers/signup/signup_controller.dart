import 'package:email_sender/common/widgets/loaders/loaders.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/user/user_repository.dart';
import 'package:email_sender/pages/signup/verify_email.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/device/device_utility.dart';
import 'package:email_sender/utils/formatter/formatter.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';
import 'package:email_sender/utils/helpers/network_manager.dart';
import 'package:email_sender/utils/popups/full_screen_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final checkTermsAndConditions = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //Form Key for Form Validation

  /// Signup
  void signup() async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(
          'We are Processing Your Information...',
          CustomImages.productsIllustration);
      // Check internet Connectivity
      final isConnected = await CustomDeviceUtils.hasInternetConnection();
      if (!isConnected) {
        return;
      }
      // FormValidation
      if (signupFormKey.currentState!.validate()) {
        return;
      }
      // Privacy Policy Check

      if (!checkTermsAndConditions.value) {
        CustomLoaders.warningSnackBar(
            title: "Accept the Privacy Policy",
            message:
                "In order to create an account, you have to read and accept the Privacy Policy and Terms of Use");
      }

      // Register user in Firebase / Database & Save user Data
      final user = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // Save authenticated user data in Firebase Firestore
      final newUser = UserModel(
          id: user?.user!.uid,
          displayName: firstName.text.trim() + lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '', //TODO: Implement profile picture
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser); //Save user to Firebase
    } catch (e) {
      CustomLoaders.errorSnackBar(title: 'Oh No!', message: e.toString());

      //Show Success Message

      CustomLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been Created! Verify your email to Continue');

      Get.to(CustomRoutes.verifyEmailScreen);

      // Show some generic message
    } finally {
      CustomFullScreenLoader.stopLoading();
    }
  }
}
