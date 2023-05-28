import 'package:flutter/cupertino.dart';
import 'package:stackivy_ardilla/ui/pages/auth/auth_base_page.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

import '../../models/onboarding_item.dart';

class OnboardingVM extends ChangeNotifier {
  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
        imageName: "onboarding_top.png",
        titleText: "Lorem Ipsum Kip Antares Lorem",
        subtitleText: "Lorem ipsum dolor sit amet consectetur. "
            "Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at."),
    OnboardingItem(
        imageName: "onboarding_top.png",
        titleText: "Lorem Ipsum Kip Antares Lorem",
        subtitleText: "Lorem ipsum dolor sit amet consectetur. "
            "Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at."),
    OnboardingItem(
        imageName: "onboarding_top.png",
        titleText: "Lorem Ipsum Kip Antares Lorem",
        subtitleText: "Lorem ipsum dolor sit amet consectetur. "
            "Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at."),
  ];

  late final PageController _pageController;

  List<OnboardingItem> get onboardingItems => _onboardingItems;

  PageController get pageController => _pageController;

  int currentPage = 0;

  final Duration _pageNaviDuration = const Duration(milliseconds: 500);
  final Curve _pageNaviCurve = Curves.fastOutSlowIn;

  OnboardingVM() {
    _pageController = PageController()
      ..addListener(() {
        int newPage = _pageController.page?.toInt() ?? 0;
        if (newPage != currentPage) {
          currentPage = newPage;
          notifyListeners();
        }
      });
  }

  void pageNext() {
    if (currentPage < onboardingItems.length - 1) {
      _pageController.nextPage(
          duration: _pageNaviDuration, curve: _pageNaviCurve);
    } else {
      navigateToLogin();
    }
  }

  void navigateToLogin() {
    navigatorKey.currentState!.pushReplacementNamed(AuthBasePage.routeName);
  }
}
