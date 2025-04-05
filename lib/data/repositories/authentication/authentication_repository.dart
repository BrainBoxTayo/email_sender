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
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    update();
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
      print(e);
      return null;
    } on FirebaseException catch (e) {
      print(e);
    } on FormatException catch (_) {
      print("Format");
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
