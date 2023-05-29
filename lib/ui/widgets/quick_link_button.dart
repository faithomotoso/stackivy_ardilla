import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';

class QuickLinkButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final String svgIconPath;
  final VoidCallback? onTap;

  const QuickLinkButton(
      {required this.buttonColor,
      required this.buttonText,
      required this.svgIconPath,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(16);

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: LayoutBuilder(
              builder: (
                ctx,
                constraints,
              ) {
                return ClipRRect(
                  borderRadius: borderRadius,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: constraints.maxWidth * 0.9,
                            height: constraints.maxHeight,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: buttonColor.withOpacity(0.4),
                                  borderRadius: borderRadius),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                          bottom: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: buttonColor, borderRadius: borderRadius),
                            child: Center(
                              child: SvgPicture.asset(
                                svgIconPath,
                                color: Colors.white,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            buttonText,
            style: const TextStyle(color: AppColors.c3D0072, fontSize: 14),
          )
        ],
      ),
    );
  }
}
