import 'package:email_sender/common/widgets/layouts/Headers/custom-headers.dart';
import 'package:email_sender/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

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
      appBar: CustomHeader(scaffoldKey: scaffoldKey),
      body: body,
    );
  }
}
