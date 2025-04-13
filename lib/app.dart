import 'package:email_sender/common/bindings/general_bindings.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/user/models/user.dart';
import 'package:email_sender/data/repositories/user/user_repository.dart';
import 'package:email_sender/features/not-found/404-not-found.dart';
import 'package:email_sender/utils/routes/app_routes.dart';
import 'package:email_sender/utils/routes/routes.dart' show CustomRoutes;
import 'package:email_sender/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme});

  final ThemeData theme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Initialize repositories
    Get.put(UserRepository());
    Get.put(AuthenticationRepository());

    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
       if (user.providerData.any((p) => p.providerId == 'microsoft.com')){
          UserModel newUser = UserModel(
          displayName: user.displayName,
          profilePicture: user.photoURL,
          phoneNumber: user.phoneNumber,
          email: user.email,
          id: user.uid,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        
        Get.find<UserRepository>().saveUserRecord(newUser);
        }
        
      }
    });

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Email Sender',
      theme: theme,
      initialRoute: CustomRoutes.dashboard,
      initialBinding: GeneralBindings(),
      getPages: CustomAppRoute.pages,
      unknownRoute: GetPage(
        name: CustomRoutes.notFoundPage,
        page: () => NotFoundPage(),
      ),
    );
  }
}
