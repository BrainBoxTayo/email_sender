import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailGroup {
  
  String? name;
  String? createdBy;
  List<String> memberEmails = [];
  DateTime? createdAt;
  DateTime? lastEmailSentAt;
  
  EmailGroup(
    {
      this.name,
      this.createdAt,
      this.createdBy,
      required this.memberEmails,
      this.lastEmailSentAt,
    }
  );

  factory EmailGroup.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot
  ){
    final data = snapshot.data();
    return EmailGroup(
      memberEmails: List.from(data?['memberEmails']),
      name: data?['name'],
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      lastEmailSentAt: (data?['lastEmailSentAt'] as Timestamp).toDate(),
      createdBy: data?['createdBy'],
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'createdBy': createdBy,
      'memberEmails': memberEmails,
      'createdAt': Timestamp.fromDate(createdAt!),
      'lastEmailSentAt': Timestamp.fromDate(lastEmailSentAt!),
    };
  }

  Future<void> saveToFirestore() async {
    final docRef = FirebaseFirestore.instance.collection('emailGroups').doc(FirebaseAuth.instance.currentUser?.uid).collection('groups').doc(name);
    await docRef.set(toJson());
  }

  Future<void> deleteFromFirestore() async {
    final docRef = FirebaseFirestore.instance.collection('emailGroups').doc(FirebaseAuth.instance.currentUser?.uid).collection('groups').doc(name);
    await docRef.delete();
  }

}