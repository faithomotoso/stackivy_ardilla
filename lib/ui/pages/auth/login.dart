import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/app_button.dart';
import 'package:stackivy_ardilla/ui/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                          .copyWith(top: 30),
                  children: [
                    Text(
                      "Welcome!",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: AppColors.c3D0072,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Here's how to log in to access your account",
                      style: TextStyle(color: AppColors.c6B7280),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      textController: userNameController,
                      hintText: "Email address or Kode Hex",
                      svgIconPath: getFullSvgPath(iconName: "mail_icon.svg"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      textController: passwordController,
                      hintText: "Password",
                      svgIconPath: getFullSvgPath(iconName: "lock.svg"),
                      isPassword: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?"),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    AppButton(onPressed: (){}, buttonText: "Log In")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
