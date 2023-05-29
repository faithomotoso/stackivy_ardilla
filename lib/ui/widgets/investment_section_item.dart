import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';

class InvestmentSectionItem extends StatelessWidget {
  final String investmentTitle;
  final String investmentSubtitle;
  final String buttonText;
  final String svgIconPath;
  final VoidCallback onTap;
  final List<Color> gradientColors;

  const InvestmentSectionItem(
      {required this.investmentTitle,
      required this.investmentSubtitle,
      required this.buttonText,
      required this.svgIconPath,
      required this.onTap,
      required this.gradientColors,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(20),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            svgIconPath,
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            investmentTitle,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: AppColors.c3D0072, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            investmentSubtitle,
            style: const TextStyle(
                color: AppColors.c9CA3AF, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          ),
          TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.c8E15F8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(buttonText),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(CupertinoIcons.arrow_right)
                ],
              ))
        ],
      ),
    );
  }
}
