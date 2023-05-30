import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

class AccountBalanceSectionItem extends StatefulWidget {
  final String balanceTitle;
  final String currency;
  final double amount;
  final Color color;
  final bool showDotsBg;

  const AccountBalanceSectionItem(
      {required this.balanceTitle,
      required this.currency,
      required this.amount,
      required this.color,
      this.showDotsBg = true,
      Key? key})
      : super(key: key);

  @override
  State<AccountBalanceSectionItem> createState() =>
      _AccountBalanceSectionItemState();
}

class _AccountBalanceSectionItemState extends State<AccountBalanceSectionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
          image: widget.showDotsBg
              ? DecorationImage(
                  image: AssetImage(getFullImagePath(imageName: "dots_bg.png")),
                  fit: BoxFit.cover)
              : null),
    );
  }
}
