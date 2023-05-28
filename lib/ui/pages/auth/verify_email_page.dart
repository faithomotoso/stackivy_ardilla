import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:stackivy_ardilla/ui/pages/auth/complete_profile_page.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/app_button.dart';

class VerifyEmailPage extends StatelessWidget {
  static const String routeName = "/auth/verify";

  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(
                color: AppColors.c3D0072,
              ),
              Center(
                child: Image.asset(
                  getFullImagePath(imageName: "verify_vectors.png"),
                  height: 300,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Verify your email address",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: AppColors.c3D0072, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppButton(
                onPressed: () {
                  // OpenMailApp.openMailApp();
                },
                buttonText: "Open Email App",
                useOutlinedStyle: true,
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                  onPressed: () {
                    navigatorKey.currentState!
                        .pushNamed(CompleteProfilePage.routeName);
                  },
                  buttonText: "Continue"),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
