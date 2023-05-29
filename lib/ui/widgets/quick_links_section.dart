import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/quick_link_button.dart';

class QuickLinksSection extends StatelessWidget {
  const QuickLinksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Links",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: AppColors.c3D0072),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            QuickLinkButton(
                buttonColor: AppColors.primary,
                buttonText: "SAN",
                svgIconPath: getFullSvgPath(iconName: "stars.svg")),
            QuickLinkButton(
                buttonColor: AppColors.cE8356D,
                buttonText: "Save",
                svgIconPath: getFullSvgPath(iconName: "save.svg")),
            QuickLinkButton(
                buttonColor: AppColors.c14B8A6,
                buttonText: "Learn",
                svgIconPath: getFullSvgPath(iconName: "book.svg")),
            QuickLinkButton(
                buttonColor: AppColors.cFACC15,
                buttonText: "Payment",
                svgIconPath: getFullSvgPath(iconName: "payment.svg")),
          ],
        )
      ],
    );
  }
}
