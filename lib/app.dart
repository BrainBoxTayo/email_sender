import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/user/user_repository.dart';
import 'package:email_sender/pages/not-found/404-not-found.dart';
import 'package:email_sender/utils/routes/app_routes.dart';
import 'package:email_sender/utils/routes/routes.dart' show CustomRoutes;
import 'package:email_sender/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Initialize repositories
    Get.put(UserRepository());
    Get.put(AuthenticationRepository());

    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        UserModel newUser = UserModel(
          displayName: user.displayName,
          profilePicture: user.photoURL,
          phoneNumber: user.phoneNumber,
          email: user.email,
          id: user.uid,
        );
        Get.find<UserRepository>().saveUserRecord(newUser);
      }
    });

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: CustomAppTheme.darkTheme,
      title: 'Email Sender',
      theme: CustomAppTheme.lightTheme,
      initialRoute: CustomRoutes.dashboard,
      getPages: CustomAppRoute.pages,
      unknownRoute: GetPage(
        name: CustomRoutes.notFoundPage,
        page: () => NotFoundPage(),
      ),
    );
  }
}
