import 'package:email_sender/data/repositories/user/user_repository.dart';
import 'package:email_sender/pages/emailSend/emailSend.dart';
import 'package:email_sender/pages/homePage/home_page.dart';
import 'package:email_sender/pages/not-found/404-not-found.dart';
import 'package:email_sender/pages/sign_in/signInPage.dart';
import 'package:email_sender/utils/constants/app_routes.dart';
import 'package:email_sender/utils/constants/routes.dart' show CustomRoutes;
import 'package:email_sender/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UserRepository());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: CustomAppTheme.darkTheme,
      title: 'Email Sender',
      theme: CustomAppTheme.lightTheme,
      home: authenticationStreamBuilder(),
      getPages: CustomAppRoute.pages,
      unknownRoute:  GetPage(name: CustomRoutes.notFoundPage, page: () => NotFoundPage()),
    );
  }

  StreamBuilder<User?> authenticationStreamBuilder() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData == true) {
          final User? user = snapshot.data;
          UserModel? newUser = UserModel(
            displayName: user?.displayName,
            profilePicture: user?.photoURL,
            phoneNumber: user?.phoneNumber,
            email: user?.email,
            id: user?.uid,
          );
          final userRepo = Get.find<UserRepository>();
          userRepo.saveUserRecord(newUser);
          return HomePage(title: "Email Sender");
        } else {
          return SignInPage();
        }
      },
    );
  }
}
