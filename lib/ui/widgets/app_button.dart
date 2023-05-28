import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const AppButton({
    required this.onPressed,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: AppColors.primary,
            shape: const StadiumBorder()),
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }
}
