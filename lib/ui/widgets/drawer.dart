import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackivy_ardilla/core/view_models/auth/auth_vm.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/avatar_url_image.dart';
import 'package:stackivy_ardilla/ui/widgets/drawer_item_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(horizontalPadding),
        child: SafeArea(
          child: Consumer<AuthVM>(
            builder: (ctx, vm, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarUrlImage(imageUrl: vm.user?.profilePictureUrl),
                  if (vm.user != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        vm.user!.fullName,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView(
                    children: List<Widget>.of([
                      DrawerItemWidget(
                          svgIconPath: getFullSvgPath(iconName: "profile.svg"),
                          itemText: "Profile"),
                      DrawerItemWidget(
                          svgIconPath:
                              getFullSvgPath(iconName: "portfolio.svg"),
                          itemText: "Portfolio"),
                      DrawerItemWidget(
                          svgIconPath: getFullSvgPath(iconName: "payment.svg"),
                          itemText: "Payment"),
                      DrawerItemWidget(
                        svgIconPath: getFullSvgPath(iconName: "investment.svg"),
                        itemText: "Investment",
                        isComingSoon: true,
                      ),
                      DrawerItemWidget(
                        svgIconPath: getFullSvgPath(iconName: "insurance.svg"),
                        itemText: "Insurance",
                        isComingSoon: true,
                      ),
                      DrawerItemWidget(
                          svgIconPath:
                              getFullSvgPath(iconName: "budgeting.svg"),
                          itemText: "Budgeting")
                    ].map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: e,
                        ))),
                  )),
                  DrawerItemWidget(
                      onTap: () {},
                      svgIconPath: getFullSvgPath(iconName: "log_out.svg"),
                      itemText: "Log Out")
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
