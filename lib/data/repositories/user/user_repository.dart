
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:email_sender/utils/formatter/formatter.dart';

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
      print(e);
    }
  }

  ///Function to fetch user details based on user ID
  Future<Map<String, dynamic>> getUserDetails(String? userID) async {
    DocumentSnapshot<Map<String, dynamic>> userDetails;
    try {
      userDetails = await _db.collection("Users").doc(userID).get();
      return userDetails.data() ?? {};
    } catch (e) {
      print("In user repo: ${e}");
    }
   return {};
  }

  ///Function to update user data
}

class UserModel {
  String? id;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? profilePicture;

  UserModel(
      {  this.id,
         this.displayName,
         this.email,
         this.phoneNumber,
         this.profilePicture,
        });

  static UserModel empty() => UserModel(
      id: "",
      email: "",
      phoneNumber: "",
      profilePicture: "",
      displayName: ""
  );

  Map<String, dynamic> toJson() {
    return {
      'Display Name': displayName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          displayName: data["displayName"] ?? '',
          email: data["email"] ?? '',
          phoneNumber: data["phoneNumber"] ?? '',
          profilePicture: data["profilePicture"] ?? '',
      );
    }
    return UserModel.empty();
  }
}
