import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/common/widgets/loaders/loaders.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/email/models/email_address.dart';
import 'package:email_sender/data/repositories/email/models/email_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EmailAddressController extends GetxController {
  static EmailAddressController get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function initialize a group in firestore
  Future<void> initializeGroup(
    String emailAddress,
    EmailGroup emailGroup,
  ) async {
    try {
      await emailGroup.saveToFirestore();
      await _db
          .collection("emailGroups")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection("groups")
          .doc(emailGroup.name)
          .update({
            "memberEmails": FieldValue.arrayUnion([emailAddress]),
          });
    } on Exception catch (e) {
      CustomLoaders.errorSnackBar(title: e.toString(), message: e.toString());
    }
  }

  //Function to add an email to a group

  Future<void> addEmailToGroup(
    String emailAddress,
    String? emailGroupName,
  ) async {
    try {
      await _db
          .collection("emailGroups")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection("groups")
          .doc(emailGroupName)
          .update({
            "memberEmails": FieldValue.arrayUnion([emailAddress]),
          });
      CustomLoaders.successSnackBar(
        title: "Success",
        message: "Email added to group",
      );
      Get.back();
    } on Exception catch (e) {
      CustomLoaders.errorSnackBar(title: e.toString(), message: e.toString());
    }
  }
}
