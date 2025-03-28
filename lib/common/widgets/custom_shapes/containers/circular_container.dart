import 'package:flutter/material.dart';
import 'package:email_sender/utils/constants/colors.dart';


class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    required this.width,
    required this.height,
    this.radius = 300,
    this.padding = 0,
    this.child,
    this.backgroundColor = CustomColors.white,
  });

  final double width;
  final double height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: backgroundColor
      ),
      child: child,
    );
  }
}