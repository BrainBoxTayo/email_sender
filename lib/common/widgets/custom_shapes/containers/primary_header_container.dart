import 'package:email_sender/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:email_sender/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class CustomPrimaryHeaderContainer extends StatelessWidget {
  const CustomPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesWidget(
      child: Container(
        color: Colors.deepPurple,
        child: Stack(
          children: [
            Positioned(top: -250, right: -250, child: CustomCircularContainer(padding: 0, height: 300, width: 300, backgroundColor: CustomColors.white.withOpacity(0.1),)),
            Positioned(top: 100, right: -250, child: CustomCircularContainer(padding: 0, height: 300, width: 300, backgroundColor: CustomColors.white.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}