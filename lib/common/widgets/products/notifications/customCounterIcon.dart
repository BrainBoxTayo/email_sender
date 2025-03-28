import 'package:email_sender/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomCounterIcon extends StatelessWidget {
  const CustomCounterIcon({
    super.key,
    required this.dark,
    required this.onPressed,
  });

  final bool dark;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.notification,
              color:
              dark ? CustomColors.white : CustomColors.primary),
          iconSize: 30,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: CustomColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              //TODO: The text has to be dynamic and change with the amount of cars the user has feedback on
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.white),),
            ),
          ),
        )
      ],
    );
  }
}
