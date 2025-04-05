import 'package:get/get.dart';

class ButtonStateController extends GetxController {
  static ButtonStateController get instance => Get.find();
  final isActive = false.obs;
  final isHovered = false.obs;

  void changeActiveState(){
    isActive.value = !isActive.value;
  }

  void changeHoverState() {
    if (!isActive.value){
      isHovered.value = !isHovered.value;
    }

  void onTap (String route) {
    Get.toNamed(route);
  }


}
}