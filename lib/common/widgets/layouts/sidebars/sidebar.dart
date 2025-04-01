import 'package:email_sender/common/widgets/images/customCircularImage.dart';
import 'package:email_sender/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/constants/routes.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.white,
          border: Border(right: BorderSide(color: CustomColors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomCircularImage(dark: false, image: CustomImages.darkAppLogo),
              SizedBox(height: CustomSizes.spaceBtwSections),
              Padding(
                  padding: EdgeInsets.all(CustomSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MENU', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),

                    //Menu Items
                    CustomMenuItem(icon: Iconsax.status,itemName: "Dashboard", route: CustomRoutes.homeScreen,),
                    Divider(),
                    Text('APPS', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),
                    CustomMenuItem(icon: Icons.mail ,itemName: "Email Sender", route: CustomRoutes.emailScreen,),
                    CustomMenuItem(icon: Icons.set_meal,itemName: "Meals", route: '/none',),

                    Divider(),
                    Text('OTHERS', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),

                    //Menu Items
                    CustomMenuItem(icon: Iconsax.user_edit ,itemName: "Profile Setings", route: "/profile_settings",),
                    CustomMenuItem(icon: Icons.mail ,itemName: "App Settings", route: "/app_settings",),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

