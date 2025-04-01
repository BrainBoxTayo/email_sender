import 'package:email_sender/common/widgets/loaders/loaders.dart';
import 'package:email_sender/data/repositories/authentication/authentication_repository.dart';
import 'package:email_sender/data/repositories/user/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController{

  static UserController get instance => Get.find();

  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;


  final userRepository =  Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  // Fetch user details from the repo

  Future<UserModel> fetchUserDetails() async {
    try {
      isLoading.value = true;
      final user = await userRepository.getUserDetails();
      this.user.value = user;
      isLoading.value = false;
      return user;
      
    } catch (e) {
      isLoading.value = false;
      CustomLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
      return UserModel.empty();      
    }
  }
  
  
}