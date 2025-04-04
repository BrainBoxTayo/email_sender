import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomGridLayout extends StatelessWidget {
  const CustomGridLayout({
    super.key, required this.itemCount, this.mainAxisExtent = 288, required this.itemBuilder,
  });

  final int itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: CustomSizes.gridViewSpacing,
          crossAxisSpacing: CustomSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent
      ),

     itemBuilder: itemBuilder,

    );
  }
}