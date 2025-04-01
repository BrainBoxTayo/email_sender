import 'package:email_sender/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteObservers extends GetObserver{

  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sideBarController = Get.put(SidebarController());

    if (previousRoute != null){
      for (var routeName in CustomRoutes.sideMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sideBarController.activeItem.value = routeName;
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute){
    final sideBarController = Get.put(SidebarController());

    if (route != null){
      for (var routeName in CustomRoutes.sideMenuItems) {
        if (route.settings.name == routeName) {
          sideBarController.activeItem.value = routeName;
        }
      }
    }
  }
}