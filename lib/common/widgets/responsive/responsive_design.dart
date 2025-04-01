import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class CustomResponsiveWidget extends StatelessWidget {
  const CustomResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  //Widget for desktop layout

  final Widget desktop;

  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= CustomSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth < 1366 && constraints.maxWidth >= 768) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
