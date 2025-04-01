import 'package:email_sender/common/widgets/responsive/responsive_design.dart';
import 'package:email_sender/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:email_sender/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:email_sender/common/widgets/responsive/screens/tablet_layout.dart';
import 'package:flutter/material.dart';

class CustomSiteTemplate extends StatelessWidget {
  const CustomSiteTemplate({super.key, this.desktop, this.tablet, this.mobile, this.useLayout = true});

  final Widget? desktop;

  final Widget? tablet;

  final Widget? mobile;

  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveWidget(
      desktop: useLayout ? DesktopLayout(body: desktop) :desktop ?? Container(),
      tablet: useLayout ? TabletLayout(body: tablet) : tablet ?? Container(),
      mobile: useLayout ? MobileLayout(body: mobile) : mobile ?? Container(),
    );
  }
}
