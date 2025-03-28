import 'package:email_sender/common/widgets/images/customCircularImage.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile({
    super.key,
    required this.dark, this.onTap,
  });

  final bool dark;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomCircularImage(
        dark: dark,
        image: CustomImages.user,
        height: 50,
        width: 50,
        padding: 0,
      ),
      title: Text(
        "UserName",
        style: Theme.of(context).textTheme.headlineSmall!.apply(
          color: CustomColors.white,
        ),
      ),
      subtitle: Text(
        "email",
        style: Theme.of(context).textTheme.bodyMedium!.apply(
          color: CustomColors.white,
        ),
      ),
      trailing: IconButton(
          onPressed: onTap,
          icon: const Icon(
            Iconsax.edit,
            color: CustomColors.white,
          )),
    );
  }
}
