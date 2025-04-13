import 'dart:async';

import 'package:email_sender/common/widgets/loaders/loaders.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  ///Send email when verify screen appears
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      CustomLoaders.successSnackBar(title: "emailSent");
    } catch (e) {
      CustomLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
    }
    
  }

  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
        timer.cancel();
        AuthenticationRepository.instance.screenRedirect();
      }
    });
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser?.emailVerified == true) {

      AuthenticationRepository.instance.screenRedirect();
    }
  }
}