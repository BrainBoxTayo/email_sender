import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart';

class CustomAnimationLoaderWidget extends StatelessWidget {
  /// Default COnstuctor for the CustomAnimationLoader
  /// Parameters:
  ///   - text: the text to be displayed
  ///   - animation - the path to the lottie animation file
  ///   - showAction - Whether to show an action below the text
  ///   - actionText - The text to be displayed on the action button
  ///   - onActionPressed - Callback to be executed when the action button is pressed

  const CustomAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      required this.showAction,
      required this.actionText,
      required this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String actionText;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: CustomSizes.defaultSpace,),
          Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CustomSizes.defaultSpace,),

          showAction
          ? SizedBox(
            width: 250,
            child: OutlinedButton(
                onPressed: onActionPressed,
                child: Text(
                  actionText,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.light),
                )
            ),
          ) : const SizedBox()

        ],
      ),
    );
  }
}
