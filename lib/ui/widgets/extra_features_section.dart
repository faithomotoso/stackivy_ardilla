import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/extra_features_item.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExtraFeaturesSection extends StatefulWidget {
  const ExtraFeaturesSection({Key? key}) : super(key: key);

  @override
  State<ExtraFeaturesSection> createState() => _ExtraFeaturesSectionState();
}

class _ExtraFeaturesSectionState extends State<ExtraFeaturesSection> {
  final List slides = [
    ExtraFeaturesItem(
      featureName: "Rank",
      featureTitle: "Cadet",
      featureSubtitle: "Move up your Rank by completing transactions",
      titleColor: AppColors.cE8356D,
      color: AppColors.cFEF6F8,
      svgIconPath: getFullSvgPath(iconName: "cadet.svg"),
      svgIconProps: const SvgIconProps(right: 10, top: 0, bottom: 0),
    ),
    ExtraFeaturesItem(
      featureName: "Badges",
      featureTitle: "Beginner",
      featureSubtitle: "Move up your Badge by completing transactions",
      titleColor: AppColors.c3D0072,
      color: AppColors.cF9F9F9,
      svgIconPath: getFullSvgPath(iconName: "beginner_badge.svg"),
      svgIconProps: const SvgIconProps(
        bottom: -50,
        right: -60,
      ),
      extra: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(getFullSvgPath(iconName: "super_saver.svg")),
          const Text(
            "Super Saver",
            style: TextStyle(color: AppColors.c3D0072, fontSize: 10),
          )
        ],
      ),
      extraPosProps: const SvgIconProps(bottom: 0, left: 0),
    ),
    ExtraFeaturesItem(
      featureName: "Referrals",
      featureTitle: "Refer & Earn",
      featureSubtitle: "Invite using your Kode Hex.",
      color: AppColors.cF0F0FF,
      svgIconPath: getFullSvgPath(iconName: "referral_coin.svg"),
      svgIconProps: const SvgIconProps(right: 0, bottom: 0),
      onTap: () {},
    ),
    ExtraFeaturesItem(
      featureName: "Money Wise",
      featureTitle: "Financial nuggets",
      featureSubtitle: "Take a step towards financial literacy with financial "
          "advice from the best minds in the game.",
      color: AppColors.cF9F9F9,
      svgIconPath: getFullSvgPath(iconName: "financial_nuggets.svg"),
      svgIconProps: const SvgIconProps(right: 0, bottom: 0),
      onTap: () {},
    ),
  ];
  final ValueNotifier<int> slideIndexNotifier = ValueNotifier(0);

  @override
  void dispose() {
    slideIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: slides.length,
            separatorBuilder: (ctx, index) =>
            const SizedBox(
              width: 20,
            ),
            itemBuilder: (ctx, index) {
              return VisibilityDetector(
                  key: Key("visible-$index"),
                  child: slides.elementAt(index),
                  onVisibilityChanged: (info) {
                    double visiblePercentage = info.visibleFraction * 100;
                    if (visiblePercentage > 90) {
                      slideIndexNotifier.value = index;
                    }
                  });
            },
          ),
        ),
        ValueListenableBuilder<int>(
            valueListenable: slideIndexNotifier,
            builder: (ctx, index, child) {
              return DotsIndicator(
                dotsCount: slides.length,
                position: index,
                decorator: const DotsDecorator(
                    color: AppColors.cE7CDFE, activeColor: AppColors.primary),
              );
            })
      ],
    );
  }
}
