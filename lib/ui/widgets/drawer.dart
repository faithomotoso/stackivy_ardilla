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
                      onTap: () {
                        showLogoutConfirmationDialog(context);
                      },
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

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Are you sure you want to Log Out?",
                    style: TextStyle(color: AppColors.c3D0072, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Log out
                          Provider.of<AuthVM>(context, listen: false).logOut();
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.cFCE4EB,
                            foregroundColor: AppColors.cE8356D),
                        child: const Text(
                          "Confirm",
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                          },
                          child: Text("No, Cancel")),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
