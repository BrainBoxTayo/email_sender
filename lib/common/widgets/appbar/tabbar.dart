import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/device/device_utility.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? CustomColors.black : CustomColors.white,
      child: TabBar(
          tabs: tabs,
          isScrollable: true,
        indicatorColor: CustomColors.primary,
        labelColor: dark ? CustomColors.white : CustomColors.primary,
        unselectedLabelColor: CustomColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(CustomDeviceUtils.getAppBarHeight());
}
