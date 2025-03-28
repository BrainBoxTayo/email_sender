import 'package:flutter/cupertino.dart';
import 'package:email_sender/utils/constants/sizes.dart';

class CustomSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CustomSizes.appBarHeight,
    bottom: CustomSizes.defaultSpace,
    left: CustomSizes.defaultSpace,
    right: CustomSizes.defaultSpace
  );
}