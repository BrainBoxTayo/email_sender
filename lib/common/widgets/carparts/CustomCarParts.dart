
import 'package:email_sender/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:email_sender/common/widgets/images/customCircularImage.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCarPartWidgets extends StatelessWidget {
  const CustomCarPartWidgets({
    super.key,
    required this.dark,
    required this.onTap,
    required this.image
  });

  final bool dark;
  final void Function()? onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CustomRoundedContainer(
          padding: const EdgeInsets.all(CustomSizes.sm),
          showBorder: true,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              //Icon
              Flexible(
                child: CustomCircularImage(
                  dark: dark,
                  image: image,
                  backgroundColor: Colors.transparent,
                  overlayColor: dark ? CustomColors.white : CustomColors.black,
                ),
              ),
              const SizedBox(
                width: CustomSizes.spaceBtwItems / 2,
              ),

              ///Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Engine",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "Suggestive Text",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textScaler: const TextScaler.linear(.7),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}