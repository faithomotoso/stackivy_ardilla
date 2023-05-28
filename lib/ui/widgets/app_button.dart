import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool useOutlinedStyle;
  final Widget? preButtonTextWidget;

  const AppButton({
    required this.onPressed,
    required this.buttonText,
    this.useOutlinedStyle = false,
    this.preButtonTextWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor:
                !useOutlinedStyle ? AppColors.primary : Colors.white,
            shape: StadiumBorder(
                side: BorderSide(
                    color: onPressed != null
                        ? AppColors.primary
                        : Colors.transparent))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (preButtonTextWidget != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: preButtonTextWidget!,
              ),
            Text(
              buttonText,
              style: TextStyle(
                  color: !useOutlinedStyle ? Colors.white : AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
