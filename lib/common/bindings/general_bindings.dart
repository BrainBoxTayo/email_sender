import 'package:email_sender/common/controllers/user_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(), fenix: true);
  }
}