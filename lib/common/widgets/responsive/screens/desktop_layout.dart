import 'package:email_sender/common/widgets/layouts/Headers/custom-headers.dart';
import 'package:email_sender/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart' show CustomSizes;
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          Expanded(child: CustomSideBar()),

          // Main Content Area
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [CustomColors.primary, Color(0xFF0A1F23)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  // Header (Fixed Height)
                  SizedBox(
                    height: 80, // Adjust as needed
                    child: CustomHeader(),
                  ),

                  // Scrollable Body
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(CustomSizes.spaceBtwSections),
                        child: body ?? const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}