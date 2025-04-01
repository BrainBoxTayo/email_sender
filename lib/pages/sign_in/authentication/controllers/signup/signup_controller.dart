import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class SignupController extends GetxController {
  static SignupController get instance => Get.find();


  Future<UserCredential?>  signUp() async {
    final OAuthProvider provider = OAuthProvider("microsoft.com");
    provider.setCustomParameters({"tenant": "55db7b94-5a52-47f9-97a3-154ea8a65ed2"});
    provider.addScope('user.read');
    provider.addScope('profile');
    try {
      final userCredential = await FirebaseAuth.instance.signInWithPopup(provider);
      return userCredential;
    } on FirebaseAuthException catch(err) {
      print(err.message);
      // Handle FirebaseAuthExceptions
      // ex: firebase_auth/account-exists-with-different-credential
    }
  }
}