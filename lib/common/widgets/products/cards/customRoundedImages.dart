import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    super.key,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imageUrl,
    this.border,
    this.fit = BoxFit.contain,
    this.backgroundColor,
    this.isNetworkImage = false,
    this.borderRadius = CustomSizes.md,
    this.padding,
    this.onPressed,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final Border? border;
  final Color? backgroundColor;
  final BoxFit fit;
  final bool isNetworkImage;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
