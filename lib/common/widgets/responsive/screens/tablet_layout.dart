import 'package:email_sender/common/widgets/appbar/appbar.dart';
import 'package:email_sender/common/widgets/layouts/Headers/custom-headers.dart';
import 'package:email_sender/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:email_sender/utils/constants/sizes.dart' show CustomSizes;
import 'package:email_sender/utils/helpers/helper_functions.dart' show CustomHelperFunctions;
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      // Obx(
      //       () => Text(
      //     userDetails.isNotEmpty
      //         ? "Hi, ${userDetails["Display Name"] ?? "User"}"
      //         : "Loading...",
      //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //     overflow: TextOverflow.ellipsis,
      //
      //   ),
      drawer: CustomSideBar(),
      appBar: CustomHeader(scaffoldKey: scaffoldKey,),
      body: body,
    );
  }
}
