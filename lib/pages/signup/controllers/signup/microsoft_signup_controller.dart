import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MicrosoftSignupController extends GetxController {
  static MicrosoftSignupController get instance => Get.find();

  // Sign-up method for Microsoft OAuth provider
  Future<UserCredential?> signUp() async {
    final OAuthProvider provider = OAuthProvider("microsoft.com");

    // Configure the OAuth provider
    provider.setCustomParameters({
      "tenant": "55db7b94-5a52-47f9-97a3-154ea8a65ed2",  // Ensure tenant is correct
    });

    provider.addScope('user.read');
    provider.addScope('profile');

    try {
      // Attempt to sign in with Microsoft using Firebase Authentication
      final userCredential = await FirebaseAuth.instance.signInWithPopup(provider);

      // Returning the userCredential after successful authentication
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
      print("Error signing in with Microsoft: ${e.message}");
      // Optionally, you could show a dialog or use Get.snackbar for error feedback
      Get.snackbar("Sign-in Failed", e.message ?? "Unknown error occurred.");
      return null;
    } catch (e) {
      // Catch any other type of error
      print("Unknown error occurred: $e");
      Get.snackbar("Error", "An unexpected error occurred.");
      return null;
    }
  }
}
