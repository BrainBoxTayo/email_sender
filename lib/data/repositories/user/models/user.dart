import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel(
      {  this.id,
         this.displayName,
         this.email,
         this.phoneNumber,
         this.profilePicture,
         this.createdAt,
         this.updatedAt,
        });

  static UserModel empty() => UserModel(
      id: "",
      email: "",
      phoneNumber: "",
      profilePicture: "",
      displayName: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
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
          createdAt: (data["createdAt"] as Timestamp).toDate(),
          updatedAt: (data["updatedAt"] as Timestamp).toDate(),
      );
    }
    return UserModel.empty();
  }
}