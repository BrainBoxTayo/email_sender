import 'package:email_sender/common/widgets/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class CustomFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              color: CustomHelperFunctions.isDarkMode(Get.context!)
                            ? CustomColors.dark
                            : CustomColors.white,
                    width: double.infinity,
                    height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 500),
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomAnimationLoaderWidget(
                            text: text,
                            animation: animation,
                            showAction: false,
                            actionText: '',
                            onActionPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
            )
    );
  }

  // Stop the current dialog
  static void stopLoading() {
    if (Navigator.of(Get.overlayContext!).canPop()) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}
