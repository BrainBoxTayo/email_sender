import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    required this.dark,
    this.width = 56,
    this.height = 56,
    this.padding = CustomSizes.sm,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
  });

  final bool dark;
  final double width, height, padding;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      padding: const EdgeInsets.all(CustomSizes.sm),
      decoration: BoxDecoration(
          color: dark
              ? CustomColors.black
              : CustomColors.white,
          borderRadius: BorderRadius.circular(100)),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
