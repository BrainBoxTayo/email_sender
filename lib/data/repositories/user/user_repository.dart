
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/user/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      throw 'something went wrong ${e.toString()}';
    }
  }

  ///Function to fetch user details based on user ID
  Future<UserModel> getUserDetails() async {
    DocumentSnapshot<Map<String, dynamic>> userDetails;
    try {
      userDetails = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      return UserModel.fromSnapshot(userDetails);
    } catch (e) {
      throw 'something went wrong ${e.toString()}';
    }
  }

  ///Function to update user data
}


