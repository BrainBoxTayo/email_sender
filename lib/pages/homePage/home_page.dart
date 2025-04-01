import 'package:email_sender/common/widgets/appbar/appbar.dart';
import 'package:email_sender/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:email_sender/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:email_sender/data/repositories/user/user_repository.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository repo = Get.find<UserRepository>();

  final RxMap<String, dynamic> userDetails = <String, dynamic>{}.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  /// Fetch user details from Firestore
  Future<void> fetchUserDetails() async {
    final String? userID = _auth.currentUser?.uid;
    if (userID != null) {
      final details = await repo.getUserDetails(userID);
      userDetails.assignAll(details); // ✅ Update observable map
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      // Obx(
      //       () => Text(
      //     userDetails.isNotEmpty
      //         ? "Hi, ${userDetails["Display Name"] ?? "User"}"
      //         : "Loading...",
      //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //     overflow: TextOverflow.ellipsis,
      //
      //   ),

     body: Row(
       children: [
         Expanded(child: CustomSideBar()),
         Expanded(
           flex: 5,
           child: Container(
             padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                          color: Colors.white,
                          ),
                            width: CustomHelperFunctions.screenWidth() / 2,
                          ),
                        ),
                        SizedBox(width: CustomSizes.spaceBtwSections,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                              color: Colors.white,
                            ),
                            width: CustomHelperFunctions.screenWidth() / 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: CustomSizes.spaceBtwSections,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
                        color: Colors.white,
                      ),
                      width: double.infinity
                    ),
                  ),
                ],
              ),
            ),
         ),
       ],
     ),
    );
  }
}
