
import 'package:email_sender/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? CustomColors.dark : CustomColors.white,
      padding: const EdgeInsets.only(
          bottom: CustomSizes.sm,
          left: CustomSizes.md,
          right: CustomSizes.sm,
          top: CustomSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
              width: 70,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark ? CustomColors.white.withOpacity(0.5) : CustomColors.dark.withOpacity(0.5),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    side: BorderSide(color: Colors.grey.withOpacity(0.1))
                ), child: const Text('Apply'),
              )
          )
        ],
      ),
    );
  }
}
