import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';

class SvgIconProps {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? size;

  const SvgIconProps({
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.size,
  });
}

class ExtraFeaturesItem extends StatelessWidget {
  final String featureName;
  final String featureTitle;
  final String featureSubtitle;
  final Color color;
  final Color? titleColor;
  final String svgIconPath;
  final VoidCallback? onTap;
  final SvgIconProps svgIconProps;
  final Widget? extra;
  final SvgIconProps? extraPosProps;

  const ExtraFeaturesItem(
      {required this.featureName,
      required this.featureTitle,
      required this.featureSubtitle,
      required this.color,
      required this.svgIconPath,
      this.titleColor,
      this.onTap,
      this.svgIconProps = const SvgIconProps(),
      this.extra,
      this.extraPosProps,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          featureName,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: AppColors.c3D0072),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color),
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return Stack(
                children: [
                  // Icon first
                  Positioned.fill(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          featureTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: titleColor ?? AppColors.c3D0072,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.6,
                          child: Text(
                            featureSubtitle,
                            style: const TextStyle(color: AppColors.c3D0072),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (onTap != null)
                          TextButton(
                              onPressed: onTap,
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.c8E15F8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text("Click here"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(CupertinoIcons.arrow_right)
                                ],
                              ))
                      ],
                    ),
                  )),
                  Positioned(
                      top: svgIconProps.top,
                      left: svgIconProps.left,
                      right: svgIconProps.right,
                      bottom: svgIconProps.bottom,
                      child: SvgPicture.asset(
                        svgIconPath,
                        height: svgIconProps.size,
                        width: svgIconProps.size,
                      )),
                  if (extra != null)
                    Positioned(
                        top: extraPosProps?.top,
                        left: extraPosProps?.left,
                        right: extraPosProps?.right,
                        bottom: extraPosProps?.bottom,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: extra!,
                        ))
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
