import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';
import 'package:stackivy_ardilla/ui/widgets/app_button.dart';
import 'package:stackivy_ardilla/ui/widgets/app_text_field.dart';

class CompleteProfilePage extends StatefulWidget {
  static const String routeName = "/auth/profile/complete";

  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController invitationCodeController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    invitationCodeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(
                  color: AppColors.c3D0072,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Complete your profile",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: AppColors.c3D0072,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ...List<Widget>.from([
                        AppTextField(
                          textController: usernameController,
                          hintText: "Username",
                          svgIconPath: getFullSvgPath(iconName: "element.svg"),
                          validator: (v) {
                            if (v == null || v!.toString().isEmpty) {
                              return "Enter your username";
                            }
                            return null;
                          },
                        ),
                        AppTextField(
                          textController: firstNameController,
                          hintText: "First Name",
                          textInputType: TextInputType.name,
                          svgIconPath: getFullSvgPath(iconName: "user.svg"),
                          validator: (v) {
                            if (v == null || v!.toString().isEmpty) {
                              return "Enter your first name";
                            }
                            return null;
                          },
                        ),
                        AppTextField(
                          textController: lastNameController,
                          hintText: "Last Name",
                          textInputType: TextInputType.name,
                          svgIconPath: getFullSvgPath(iconName: "user.svg"),
                          validator: (v) {
                            if (v == null || v!.toString().isEmpty) {
                              return "Enter your last name";
                            }
                            return null;
                          },
                        ),
                        AppTextField(
                          textController: phoneNumberController,
                          hintText: "Phone Number",
                          svgIconPath: getFullSvgPath(iconName: "phone.svg"),
                          textInputType:
                              const TextInputType.numberWithOptions(),
                          validator: (v) {
                            if (v == null || v!.toString().isEmpty) {
                              return "Enter your phone number";
                            }
                            return null;
                          },
                        ),
                        AppTextField(
                          textController: invitationCodeController,
                          hintText: "Invite code (optional)",
                          svgIconPath: getFullSvgPath(iconName: "users.svg"),
                        ),
                        AppTextField(
                          textController: passwordController,
                          hintText: "Password",
                          svgIconPath: getFullSvgPath(iconName: "lock.svg"),
                          isPassword: true,
                          validator: (v) {
                            if (v == null || v!.toString().isEmpty) {
                              return "Enter a password";
                            }
                            return null;
                          },
                        )
                      ]).map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: e,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "By signing up, you're agreeing to our ",
                            style: const TextStyle(color: AppColors.c9CA3AF),
                            children: [
                              TextSpan(
                                  text: "Terms and Conditions",
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      appLaunchUrl(
                                          url: "https://stackivy.africa");
                                    }),
                              const TextSpan(text: " and "),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      appLaunchUrl(
                                          url: "https://stackivy.africa");
                                    }),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(onPressed: () {
                        if (formKey.currentState!.validate()) {

                        }
                      }, buttonText: "Create Account")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
