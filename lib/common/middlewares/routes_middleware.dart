import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // If the user is not authenticated, redirect to the login page
    return AuthenticationRepository.instance.isAuthenticated 
        ? null 
        : const RouteSettings(name: CustomRoutes.loginScreen);
  }
}

class LogoutMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (route == CustomRoutes.logout) {
      // Handle logout
      AuthenticationRepository.instance.signOut();
      return const RouteSettings(name: CustomRoutes.loginScreen);
    }
    return null;
  }
}
