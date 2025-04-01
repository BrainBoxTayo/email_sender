import 'package:email_sender/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart' show CustomSizes;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover:
          (hovering) =>
              hovering
                  ? menuController.changeHoverItem(route)
                  : menuController.changeHoverItem(""),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: CustomSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color:
                  menuController.isHovering(route) ||
                          menuController.isActive(route)
                      ? CustomColors.primary
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(CustomSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: CustomSizes.lg,
                    top: CustomSizes.md,
                    bottom: CustomSizes.md,
                    right: CustomSizes.md,
                  ),
                  child:
                      menuController.isActive(route)
                          ? Icon(icon, color: CustomColors.white)
                          : Icon(
                            icon,
                            color:
                                menuController.isHovering(route)
                                    ? CustomColors.white
                                    : CustomColors.black,
                          ),
                ),

                Text(
                  itemName,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.apply(color: menuController.isHovering(route) || menuController.isActive(route)
                      ? CustomColors.white
                      : CustomColors.black,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
