import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackivy_ardilla/core/view_models/onboarding/onboarding_vm.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

class OnboardingPage extends StatefulWidget {
  static const String routeName = "/onboarding";

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingVM(),
      builder: (ctx, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Provider.of<OnboardingVM>(ctx, listen: false).navigateToLogin();
                  },
                  child: const Text("Skip"),
                ),
              ),
              Consumer<OnboardingVM>(builder: (ctx, vm, child) {
                return Expanded(
                  child: PageView(
                    controller: vm.pageController,
                    children:
                        List<Widget>.of(vm.onboardingItems.map((e) => Column(
                              children: [
                                Image.asset(e.imageName),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  e.titleText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.c3D0072,
                                          fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Text(
                                    e.subtitleText,
                                    style: const TextStyle(
                                        color: AppColors.c6B7280),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ))),
                  ),
                );
              }),
              Consumer<OnboardingVM>(builder: (ctx, vm, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DotsIndicator(
                        dotsCount: vm.onboardingItems.length,
                        position: vm.currentPage,
                        decorator: const DotsDecorator(
                          shape: CircleBorder(),
                          color: AppColors.cE7CDFE,
                          activeColor: AppColors.primary,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            vm.pageNext();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary, shape: const CircleBorder()),
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.arrow_right,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              }),
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
