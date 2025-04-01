import 'package:email_sender/utils/constants/routes.dart';
import 'package:email_sender/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SidebarController extends GetxController {
  final activeItem = CustomRoutes.homeScreen.obs;
  final hoverItem = ''.obs;

  void changeActiveItem(String route){
    activeItem.value = route;
  }

  void changeHoverItem(String route) {
    if (!isActive(route)){
      hoverItem.value = route;
    }
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap (String route) {
    if (!isActive(route)){
      changeActiveItem(route);
    }

    //Add a mobile check
    //Use Get.back to close the drawer
    Get.toNamed(route);
  }


}
