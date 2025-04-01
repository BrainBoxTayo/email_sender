

import 'package:email_sender/pages/emailSend/emailSend.dart';
import 'package:email_sender/pages/homePage/home_page.dart';
import 'package:email_sender/pages/not-found/404-not-found.dart';
import 'package:email_sender/utils/constants/routes.dart';
import 'package:get/get.dart';

class CustomAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: CustomRoutes.homeScreen, page: () => HomePage(title: "title")),
    GetPage(name: CustomRoutes.emailScreen, page: () => EmailPageSend()),


  ];
}