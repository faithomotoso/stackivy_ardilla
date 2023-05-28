import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stackivy_ardilla/core/view_models/auth/auth_vm.dart';
import 'package:stackivy_ardilla/core/view_models/dashboard/dashboard_vm.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/avatar_url_image.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVM>(builder: (ctx, vm, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Provider.of<DashboardVM>(context, listen: false)
                      .toggleDrawer();
                },
                child: AvatarUrlImage(imageUrl: vm.user?.profilePictureUrl)),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Good Morning",
                  style: TextStyle(color: AppColors.c9CA3AF),
                ),
                if (vm.user != null)
                  Text(
                    "Cadet <${vm.user!.firstName}/>",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppColors.c3D0072, fontWeight: FontWeight.bold),
                  )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                    getFullSvgPath(iconName: "notification.svg")))
          ],
        ),
      );
    });
  }
}
