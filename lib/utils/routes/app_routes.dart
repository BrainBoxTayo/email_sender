import 'package:email_sender/common/middlewares/routes_middleware.dart';
import 'package:email_sender/common/widgets/layouts/templates/site_layout.dart';
import 'package:email_sender/pages/emailSend/desktop_emailSend.dart';
import 'package:email_sender/pages/emailSend/mobile_emailSend.dart';
import 'package:email_sender/pages/emailSend/tablet_emailSend.dart';
import 'package:email_sender/pages/homePage/desktop_dashboard.dart';
import 'package:email_sender/pages/homePage/mobile_dashboard.dart' show MobileDashBoard;
import 'package:email_sender/pages/homePage/tablet_dashboard.dart' show TabletDashBoard;
import 'package:email_sender/pages/sign_in/signInPage.dart';
import 'package:email_sender/utils/routes/routes.dart';
import 'package:get/get.dart';

class CustomAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: CustomRoutes.loginScreen, page: () => SignInPage()),
    GetPage(
      name: CustomRoutes.dashboard, 
      page: () => CustomSiteTemplate(
        desktop: const DesktopDashBoard(),
        mobile: const MobileDashBoard(),
        tablet: const TabletDashBoard(),
      ),
      middlewares: [CustomRouteMiddleware()]
    ),
    GetPage(
      name: CustomRoutes.emailScreen, 
      page: () => CustomSiteTemplate(
        desktop: const DesktopEmailSend(),
        mobile: const MobileEmailSend(),
        tablet: const TabletEmailSend(),
      ),
      middlewares: [CustomRouteMiddleware()]
    ),
    GetPage(
      name: CustomRoutes.logout,
      page: () =>  SignInPage(), // Dummy widget, won't be shown
      middlewares: [LogoutMiddleware()]
    ),
  ];
}