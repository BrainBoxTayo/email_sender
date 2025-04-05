import 'package:email_sender/utils/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
    screenRedirect();
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    screenRedirect();
    update();
  }

  Future<UserCredential?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something went wrong. Please try again';
    } on FormatException catch (_) {
      throw 'Something went wrong. Please try again';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  

  Future<UserCredential?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something went wrong. Please try again';
    } on FormatException catch (_) {
      throw 'Something went wrong. Please try again';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Something went wrong. Please try again';
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something went wrong. Please try again';
    } on FormatException catch (_) {
      throw 'Something went wrong. Please try again';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAllNamed(CustomRoutes.dashboard);
      }else {
        Get.offAllNamed(CustomRoutes.verifyEmailScreen, arguments: {'email': user.email});
      }
    }else {
      Get.offAllNamed(CustomRoutes.loginScreen);
    }
  }
}
