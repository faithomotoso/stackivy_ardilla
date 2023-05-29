import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/investment_section_item.dart';

class InvestmentSection extends StatefulWidget {
  const InvestmentSection({Key? key}) : super(key: key);

  @override
  State<InvestmentSection> createState() => _InvestmentSectionState();
}

class _InvestmentSectionState extends State<InvestmentSection> {
  final List<Widget> items = [
    InvestmentSectionItem(
        investmentTitle: "Unprecedented access to investment opportunities",
        investmentSubtitle: "20% Monthly ROI",
        buttonText: "Start Investing",
        svgIconPath: getFullSvgPath(iconName: "investment_opp.svg"),
        onTap: () {},
        gradientColors: [
          AppColors.primary.withOpacity(0.1),
          AppColors.cD9D9D9.withOpacity(0.1),
          AppColors.cF9F9F9,
          AppColors.cF9F9F9,
        ]),
    InvestmentSectionItem(
        investmentTitle: "Build your savings the right way",
        investmentSubtitle: "12% Annual ROI",
        buttonText: "Start Investing",
        svgIconPath: getFullSvgPath(iconName: "saving_money.svg"),
        onTap: () {},
        gradientColors: [
          AppColors.c10B981.withOpacity(0.1),
          AppColors.cD9D9D9.withOpacity(0.1),
          AppColors.cF9F9F9,
          AppColors.cF9F9F9,
        ]),
    InvestmentSectionItem(
        investmentTitle: "Insurance policies you can trust",
        investmentSubtitle: "12% Annual ROI",
        buttonText: "Make your first claim",
        svgIconPath: getFullSvgPath(iconName: "shield.svg"),
        onTap: () {},
        gradientColors: [
          AppColors.cE6356D.withOpacity(0.1),
          AppColors.cD9D9D9.withOpacity(0.1),
          AppColors.cF9F9F9,
          AppColors.cF9F9F9,
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        separatorBuilder: (ctx, index) => const SizedBox(
          width: 20,
        ),
        itemBuilder: (ctx, index) => items.elementAt(index),
      ),
    );
  }
}
