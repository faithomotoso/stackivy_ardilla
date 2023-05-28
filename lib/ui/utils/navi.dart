import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/pages/auth/login.dart';
import 'package:stackivy_ardilla/ui/pages/onboarding/onboarding.dart';
import 'package:stackivy_ardilla/ui/pages/splash/splash_screen.dart';

Route<dynamic>? onGenRoutes(RouteSettings settings) {
  CupertinoPageRoute _genPageRoute(Widget page) =>
      CupertinoPageRoute(builder: (ctx) => page);

  switch (settings.name) {
    case SplashScreen.routeName:
      return _genPageRoute(SplashScreen());
    case OnboardingPage.routeName:
      return _genPageRoute(const OnboardingPage());
    case LoginPage.routeName:
      return _genPageRoute(const LoginPage());
  }
  return null;
}
