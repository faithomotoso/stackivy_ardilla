import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stackivy_ardilla/core/view_models/dashboard/dashboard_vm.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/dashboard_header.dart';
import 'package:stackivy_ardilla/ui/widgets/drawer.dart';
import 'package:stackivy_ardilla/ui/widgets/quick_links_section.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardVM(),
      builder: (ctx, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Consumer<DashboardVM>(
            builder: (ctx, vm, child) {
              return BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        getFullSvgPath(iconName: "home.svg"),
                        color: vm.selectedNavbarIndex == 0
                            ? AppColors.primary
                            : AppColors.c6B7280,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        getFullSvgPath(iconName: "save.svg"),
                        color: vm.selectedNavbarIndex == 1
                            ? AppColors.primary
                            : AppColors.c6B7280,
                      ),
                      label: "Save"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        getFullSvgPath(iconName: "explore.svg"),
                        color: vm.selectedNavbarIndex == 2
                            ? AppColors.primary
                            : AppColors.c6B7280,
                      ),
                      label: "Explore"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        getFullSvgPath(iconName: "learn.svg"),
                        color: vm.selectedNavbarIndex == 3
                            ? AppColors.primary
                            : AppColors.c6B7280,
                      ),
                      label: "Learn"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        getFullSvgPath(iconName: "wallet.svg"),
                        color: vm.selectedNavbarIndex == 4
                            ? AppColors.primary
                            : AppColors.c6B7280,
                      ),
                      label: "Dilla"),
                ],
                selectedItemColor: AppColors.primary,
                selectedIconTheme:
                    const IconThemeData(color: AppColors.primary),
                showUnselectedLabels: true,
                unselectedItemColor: AppColors.c6B7280,
                unselectedIconTheme:
                    const IconThemeData(color: AppColors.c6B7280),
                currentIndex: vm.selectedNavbarIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (i) {
                  vm.setNavbarIndex(i);
                },
              );
            },
          ),
          body: SliderDrawer(
            key: Provider.of<DashboardVM>(ctx, listen: false).drawerKey,
            appBar: null,
            slider: const AppDrawer(),
            child: SafeArea(
              child: Column(
                children: [
                  const DashboardHeader(),
                  Expanded(child: ListView(
                    children: [
                      const QuickLinksSection(),
                    ],
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
