import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';

class DrawerItemWidget extends StatelessWidget {
  final String svgIconPath;
  final String itemText;
  final bool isComingSoon;
  final VoidCallback? onTap;

  const DrawerItemWidget(
      {required this.svgIconPath,
      required this.itemText,
      this.onTap,
      this.isComingSoon = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.yellow,height: 30, width: 100,);
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor:
            MaterialStatePropertyAll(AppColors.cE7CDFE.withOpacity(0.1)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(svgIconPath),
          const SizedBox(
            width: 20,
          ),
          Text(
            itemText,
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
          if (isComingSoon)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    border: Border.all(color: Colors.white)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Coming Soon",
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
