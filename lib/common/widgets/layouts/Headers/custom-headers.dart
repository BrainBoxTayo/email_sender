import 'package:email_sender/common/controllers/user_controller.dart';
import 'package:email_sender/common/widgets/products/cards/customRoundedImages.dart';
import 'package:email_sender/common/widgets/shimmer/custom_shimmer.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/image_strings.dart';
import 'package:email_sender/utils/constants/sizes.dart';
import 'package:email_sender/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({super.key, this.scaffoldKey});

  //GlobalKey to access scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.white,
        border: Border(bottom: BorderSide(color: CustomColors.grey, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: CustomSizes.md,
        vertical: CustomSizes.sm,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading:
            !CustomDeviceUtils.isDesktopScreen(context)
                ? IconButton(
                  onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                  icon: Icon(Iconsax.menu),
                )
                : null,
        title:
            CustomDeviceUtils.isDesktopScreen(context)
                ? SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Adjust for rounded corners
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ), // Customize color and width
                      ),
                    ),
                  ),
                )
                : null,

        actions: [
          if (!CustomDeviceUtils.isDesktopScreen(context))
            IconButton(onPressed: () {}, icon: Icon(Iconsax.search_normal)),

          //Notification Button
          IconButton(icon: const Icon(Iconsax.notification), onPressed: () {}),
          const SizedBox(width: CustomSizes.spaceBtwItems / 2),

          Row(
            children: [
              CustomRoundedImage(
                imageUrl: CustomImages.user,
                width: 40,
                padding: EdgeInsets.all(2),
                height: 40,
              ),
              SizedBox(width: CustomSizes.sm),
              if (!CustomDeviceUtils.isMobileScreen(context))
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.isLoading.value ?
                      CustomShimmerEffect(width: 100, height: 20, radius: 10) :
                      Text(
                        controller.user.value.displayName ?? 'Name',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      controller.isLoading.value ?
                      CustomShimmerEffect(width: 100, height: 20, radius: 10) :
                      Text(
                        controller.user.value.email ?? 'Email',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),

            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(CustomDeviceUtils.getAppBarHeight() + 15);
}
