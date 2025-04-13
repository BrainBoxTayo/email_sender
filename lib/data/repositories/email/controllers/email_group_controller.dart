import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/email/models/email_group.dart';
import 'package:get/get.dart';

class EmailGroupController extends GetxController {
  static EmailGroupController get instance => Get.find();

  final selectedGroup = "".obs;
  Rx<EmailGroup> emailGroup = EmailGroup(memberEmails: []).obs;

  void onSelected() async {
    if (selectedGroup.value.isNotEmpty) {
      DocumentSnapshot<Map<String, dynamic>> selectedDocs =
          await FirebaseFirestore.instance
              .collection("emailGroups")
              .doc(AuthenticationRepository.instance.authUser?.uid)
              .collection("groups")
              .doc(selectedGroup.value)
              .get();
      emailGroup.value = EmailGroup.fromSnapshot(selectedDocs);
    }
  }
}
