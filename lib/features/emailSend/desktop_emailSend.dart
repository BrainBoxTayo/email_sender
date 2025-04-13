import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/email/controllers/email_group_controller.dart';
import 'package:email_sender/data/repositories/email/email_address_controller.dart';
import 'package:email_sender/data/repositories/email/models/email_group.dart';
import 'package:email_sender/features/emailSend/widgets/customDropdown.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopEmailSend extends StatelessWidget {
  const DesktopEmailSend({super.key});

  void showBlurredDialog(BuildContext context) {
    final emailAddressController = TextEditingController();
    final groupNameController = TextEditingController();
    Get.put(EmailAddressController());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            ),
            child: Container(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create New Group',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  TextField(
                    controller: groupNameController,
                    decoration: InputDecoration(
                      hintText: 'Group Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          CustomSizes.buttonRadius,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  Text(
                    'Add New Email',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  TextField(
                    controller: emailAddressController,
                    decoration: InputDecoration(
                      hintText: 'xyz@provider.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          CustomSizes.buttonRadius,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: CustomSizes.spaceBtwItems),
                      ElevatedButton(
                        onPressed: () async {
                          // Handle save
                          if (groupNameController.text.isNotEmpty &&
                              emailAddressController.text.isNotEmpty) {
                            // Create a new email address model
                            final emailAddress = emailAddressController.text;
                            await EmailAddressController.instance
                                .initializeGroup(
                                  emailAddress,
                                  EmailGroup(
                                    name: groupNameController.text,
                                    createdBy:
                                        AuthenticationRepository
                                            .instance
                                            .authUser
                                            ?.uid,
                                    memberEmails: [],
                                    createdAt: DateTime.now(),
                                    lastEmailSentAt: DateTime.now(),
                                  ),
                                );
                            Get.back();
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showBlurredDialogForAddEmail(BuildContext context) {
    final emailAddressController = TextEditingController();
    Get.put(EmailAddressController());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            ),
            child: Container(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Email',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  TextField(
                    controller: emailAddressController,
                    decoration: InputDecoration(
                      hintText: 'xyz@provider.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          CustomSizes.buttonRadius,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: CustomSizes.spaceBtwItems),
                      ElevatedButton(
                        onPressed: () async {
                          // Handle save
                          if (emailAddressController.text.isNotEmpty) {
                            // Create a new email address model
                            final emailAddress = emailAddressController.text;
                            EmailAddressController.instance.addEmailToGroup(
                              emailAddress,
                              EmailGroupController
                                  .instance
                                  .emailGroup
                                  .value
                                  .name,
                            );
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(EmailGroupController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: CustomSizes.spaceBtwSections),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                  color: Colors.white,
                ),
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Create New Group"),
                          IconButton(
                            onPressed: () {
                              showBlurredDialog(context);
                            },
                            icon: Icon(Icons.add),
                          ),
                          SizedBox(width: CustomSizes.spaceBtwSections),
                        ],
                      ),

                      SizedBox(height: CustomSizes.spaceBtwSections),
                      Row(
                        children: [
                          /// Select Groups from Dropdown
                          Text("Groups: "),
                          SizedBox(width: CustomSizes.spaceBtwItems),
                          CustomDropdown(
                            stream:
                                FirebaseFirestore.instance
                                    .collection("emailGroups")
                                    .doc(
                                      AuthenticationRepository
                                          .instance
                                          .authUser
                                          ?.uid,
                                    )
                                    .collection("groups")
                                    .snapshots(),
                            textlabel: "name",
                            onChanged: (groupId) {
                              EmailGroupController.instance.onSelected();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: CustomSizes.spaceBtwSections),

                      /// Email Addresses in Group
                      Text("Email Addresses"),
                      Row(
                        children: [
                          Expanded(
                            child: Obx(() {
                              final emails =
                                  EmailGroupController
                                      .instance
                                      .emailGroup
                                      .value
                                      .memberEmails;
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: emails.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Text(emails[index]),
                                  );
                                },
                              );
                            }),
                          ),
                          FilledButton(
                            onPressed:
                                () => showBlurredDialogForAddEmail(context),
                            child: Text("Add email to Group"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: CustomSizes.spaceBtwSections),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                  color: Colors.white,
                ),
                height: 300,
              ),
            ),
          ],
        ),
        SizedBox(height: CustomSizes.spaceBtwSections),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 400,
        ),
        SizedBox(height: CustomSizes.spaceBtwSections),
      ],
    );
  }
}
