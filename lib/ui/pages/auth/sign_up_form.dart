import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackivy_ardilla/core/view_models/auth/auth_vm.dart';
import 'package:stackivy_ardilla/ui/pages/auth/verify_email_page.dart';
import 'package:stackivy_ardilla/ui/widgets/app_button.dart';

import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/app_text_field.dart';

class SignUpForm extends StatefulWidget {
  final VoidCallback togglePageMode;

  const SignUpForm({required this.togglePageMode, Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<bool> canSubmitNotifier = ValueNotifier(false);

  @override
  void dispose() {
    emailController.dispose();
    canSubmitNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
          .copyWith(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get Started!",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: AppColors.c3D0072, fontWeight: FontWeight.bold),
              ),
              const Text(
                "To create an account, enter a valid email address",
                style: TextStyle(color: AppColors.c6B7280),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                textController: emailController,
                hintText: "Email address",
                svgIconPath: getFullSvgPath(iconName: "mail_icon.svg"),
                onChanged: (v) {
                  canSubmitNotifier.value = EmailValidator.validate(v);
                },
              ),
            ],
          ),
          Column(
            children: [
              ValueListenableBuilder<bool>(
                  valueListenable: canSubmitNotifier,
                  builder: (ctx, canSubmit, child) {
                    return AppButton(
                        onPressed: canSubmit
                            ? () {
                                Provider.of<AuthVM>(context, listen: false)
                                    .initSignUp(
                                        context: context,
                                        email: emailController.text);
                              }
                            : null,
                        buttonText: "Continue");
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: AppColors.c6B7280),
                  ),
                  TextButton(
                      onPressed: () {
                        widget.togglePageMode();
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: AppColors.primary),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
