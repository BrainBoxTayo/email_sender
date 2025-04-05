import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final rememberMe = false.obs;

  

  Future<void> emailAndPasswordLogin() async {

    try {
      CustomFullScreenLoader.openLoadingDialog('Logging in...', CustomImages.loadingAnimation);
      

      if (rememberMe.value) {
        //Save user details to local storage
      }
      
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text, password.text);

      CustomFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CustomFullScreenLoader.stopLoading();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
