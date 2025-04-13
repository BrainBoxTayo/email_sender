import 'package:cloud_firestore/cloud_firestore.dart';

class EmailAddressModel {
  final List<String> emailAddresses;
  final String group;
  final DateTime createdAt;
  final DateTime updatedAt;

  EmailAddressModel({
    required this.emailAddresses,
    required this.group,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory EmailAddressModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return EmailAddressModel(
      emailAddresses: List<String>.from(data['emailaddress']),
      group: data['group'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emailaddress': emailAddresses,
      'group': group,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  Future<void> saveToFirestore() async {
    final docRef = FirebaseFirestore.instance.collection('emailGroups').doc(group);
    await docRef.set(toJson());
  }

  Future<void> deleteFromFirestore() async {
    final docRef = FirebaseFirestore.instance.collection('emailGroups').doc(group);
    await docRef.delete();
  }

  Future<List<EmailAddressModel>> fetchGroup(String groupName) async {
  final snapshot = await FirebaseFirestore.instance.collection('emailGroups').get();
  return snapshot.docs.map((doc) => EmailAddressModel.fromSnapshot(doc)).toList();
}
}
