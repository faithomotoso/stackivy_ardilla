import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';

Future<void> showLoadingIndicator({required BuildContext context}) async {
  await showDialog(
    context: context,
    builder: (ctx) => const LoadingIndicatorP(),
  );
}

class LoadingIndicatorP extends StatelessWidget {
  const LoadingIndicatorP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}
