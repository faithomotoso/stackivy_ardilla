import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stackivy_ardilla/core/view_models/auth/auth_vm.dart';

import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import 'auth_base_page.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback togglePageMode;

  const LoginForm({required this.togglePageMode, Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
          .copyWith(top: 30),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: AppColors.c3D0072, fontWeight: FontWeight.bold),
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
              validator: (v) {
                if (v == null || v.toString().isEmpty) {
                  return "Field can not be empty";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              textController: passwordController,
              hintText: "Password",
              svgIconPath: getFullSvgPath(iconName: "lock.svg"),
              isPassword: true,
              validator: (v) {
                if (v == null || v.toString().isEmpty) {
                  return "Enter your password";
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Provider.of<AuthVM>(context, listen: false).login(
                        context: context,
                        username: userNameController.text,
                        password: passwordController.text);
                  }
                },
                buttonText: "Log In"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: const [
                  Expanded(
                      child: Divider(
                    color: AppColors.cF3F4F6,
                  )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Or",
                        style: TextStyle(color: AppColors.cD1D5DB),
                      )),
                  Expanded(
                      child: Divider(
                    color: AppColors.cF3F4F6,
                  ))
                ],
              ),
            ),
            AppButton(
              useOutlinedStyle: true,
              onPressed: () {},
              buttonText: "Sign in with SAN ID",
              preButtonTextWidget:
                  SvgPicture.asset(getFullSvgPath(iconName: "log_in_san.svg")),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "New user?",
                    style: TextStyle(color: AppColors.c6B7280),
                  ),
                  TextButton(
                      onPressed: () {
                        widget.togglePageMode();
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: AppColors.primary),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
