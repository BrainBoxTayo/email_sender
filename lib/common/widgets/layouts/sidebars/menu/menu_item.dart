import 'package:email_sender/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:email_sender/utils/constants/colors.dart';
import 'package:email_sender/utils/constants/sizes.dart' show CustomSizes;
import 'package:email_sender/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    super.key,
    this.route,
    required this.icon,
    required this.itemName,
    this.onClick,
  });

  final String? route;
  final IconData icon;
  final String itemName;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () {
        if (route != null) {
          menuController.menuOnTap(route!);
        } else {
          onClick?.call();
        }
      },
      onHover:
          (hovering) =>
              hovering
                  ? menuController.changeHoverItem(route ?? CustomRoutes.notFoundPage)
                  : menuController.changeHoverItem(""),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: CustomSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color:
                  menuController.isHovering(route ?? CustomRoutes.notFoundPage) ||
                          menuController.isActive(route ?? CustomRoutes.notFoundPage)
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
                      menuController.isActive(route ?? CustomRoutes.notFoundPage)
                          ? Icon(icon, color: CustomColors.white)
                          : Icon(
                            icon,
                            color:
                                menuController.isHovering(route ?? CustomRoutes.notFoundPage)
                                    ? CustomColors.white
                                    : CustomColors.black,
                          ),
                ),

                Text(
                  itemName,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color:
                        menuController.isHovering(route ?? CustomRoutes.notFoundPage) ||
                                menuController.isActive(route ?? CustomRoutes.notFoundPage)
                            ? CustomColors.white
                            : CustomColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
