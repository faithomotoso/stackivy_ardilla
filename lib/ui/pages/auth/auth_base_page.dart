import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/pages/auth/login_form.dart';
import 'package:stackivy_ardilla/ui/pages/auth/sign_up_form.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

enum AuthPageMode { login, getStarted }

class AuthBasePage extends StatefulWidget {
  static const String routeName = "/auth";

  const AuthBasePage({Key? key}) : super(key: key);

  @override
  State<AuthBasePage> createState() => _AuthBasePageState();
}

class _AuthBasePageState extends State<AuthBasePage> {
  late final ValueNotifier<AuthPageMode> authPageModeNotifier;

  @override
  void initState() {
    authPageModeNotifier = ValueNotifier(AuthPageMode.login);
    super.initState();
  }

  @override
  void dispose() {
    authPageModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        getFullImagePath(imageName: "login_background.png")),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                      getFullSvgPath(iconName: "logo_w_name.svg")),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.68,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ValueListenableBuilder<AuthPageMode>(
                  valueListenable: authPageModeNotifier,
                  builder: (ctx, mode, child) {
                    return AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: LoginForm(togglePageMode: toggleAuthPageMode),
                      secondChild:
                          SignUpForm(togglePageMode: toggleAuthPageMode),
                      crossFadeState: mode == AuthPageMode.login
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void toggleAuthPageMode() {
    authPageModeNotifier.value =
        authPageModeNotifier.value == AuthPageMode.login
            ? AuthPageMode.getStarted
            : AuthPageMode.login;
  }
}
