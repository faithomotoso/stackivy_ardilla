import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/pages/onboarding/onboarding.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash-screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary),
      child: Stack(
        children: [
          Positioned.fill(
              child: SvgPicture.asset(
                  getFullSvgPath(iconName: "splash_vectors.svg"))),
          Center(
            child:
                SvgPicture.asset(getFullSvgPath(iconName: "ardilla_logo.svg")),
          )
        ],
      ),
    );
  }
}
