import 'package:email_sender/common/widgets/loaders/loaders.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/user/models/user.dart';
import 'package:email_sender/data/repositories/user/user_repository.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/popups/full_screen_loader.dart';
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
        CustomImages.loadingAnimation,
      );
      // FormValidation
      if (!signupFormKey.currentState!.validate()) {
        CustomFullScreenLoader.stopLoading();
        return;
      }
      // Privacy Policy Check

      if (!checkTermsAndConditions.value) {
        CustomFullScreenLoader.stopLoading();
        CustomLoaders.warningSnackBar(
          title: "Accept the Privacy Policy",
          message:
              "In order to create an account, you have to read and accept the Privacy Policy and Terms of Use",
        );
        return;
      }

      // Register user in Firebase / Database & Save user Data
      final user = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      // Save authenticated user data in Firebase Firestore
      final newUser = UserModel(
        id: user?.user!.uid,
        displayName: '${firstName.text.trim()} ${lastName.text.trim()}'.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '', //TODO: Implement profile picture
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser); //Save user to Firebase

      CustomFullScreenLoader.stopLoading();
      CustomLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been Created! Verify your email to Continue',
      );
      Get.toNamed(
        CustomRoutes.verifyEmailScreen,
        arguments: {"email": email.text.trim()},
      );
    } catch (e) {
      CustomFullScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh No!', message: e.toString());
    }
  }
}
