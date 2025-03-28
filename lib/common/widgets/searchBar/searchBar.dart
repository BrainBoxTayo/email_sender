import 'dart:core';

import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/device/device_utility.dart';
import 'package:email_sender/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({
    super.key,
    required this.text,
    this.iconData,
    this.onTap,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace)
  });

  final String text;
  final IconData? iconData;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: CustomDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(CustomSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                ? CustomColors.dark
                : CustomColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            border: showBorder
                ? Border.all(
              color: dark ? CustomColors.darkerGrey : CustomColors.grey,
            )
                : null,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: dark ? CustomColors.darkerGrey : CustomColors.grey,
              ),
              const SizedBox(width: CustomSizes.md),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
