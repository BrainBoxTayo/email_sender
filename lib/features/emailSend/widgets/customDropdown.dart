import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/data/repositories/email/controllers/email_group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatelessWidget {
  CustomDropdown({super.key, required this.stream, required this.textlabel, this.onChanged,});
  
  final Stream<QuerySnapshot> stream;
  final String textlabel;
  final void Function(String groupId)? onChanged;

  // final RxString selectedValue = "".obs;

  @override
  Widget build(BuildContext context) {
    
    final emailGroupController = EmailGroupController.instance;
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final data = snapshot.data!.docs.reversed.toList();

        // Build fresh listContent
        final listContent = data
            .where((doc) => doc.data().toString().contains(textlabel)) // Optional: skip docs without the field
            .map((doc) {
              final label = doc[textlabel];
              return DropdownMenuItem<String>(
                value: doc.id,
                child: Text(label),
              );
            }).toList();

        // Ensure selectedValue exists in the list
        if (listContent.isNotEmpty && 
            !listContent.any((item) => item.value == emailGroupController.selectedGroup.value)) {
          emailGroupController.selectedGroup.value = listContent.first.value!;
        }

        return Obx(
          () => DropdownButton<String>(
            value: emailGroupController.selectedGroup.value.isEmpty ? null : emailGroupController.selectedGroup.value,
            onChanged: (value) {
              if (value != null) {
                emailGroupController.selectedGroup.value = value;
                if(onChanged != null) onChanged!(value);
              }
            },
            items: listContent,
            hint: Text("Select a group"),
          ),
        );
      },
    );
  }
}
