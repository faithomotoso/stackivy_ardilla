import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/pages/auth/auth_base_page.dart';
import 'package:stackivy_ardilla/ui/pages/auth/complete_profile_page.dart';
import 'package:stackivy_ardilla/ui/pages/auth/verify_email_page.dart';
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
    case AuthBasePage.routeName:
      return _genPageRoute(const AuthBasePage());
    case VerifyEmailPage.routeName:
      return _genPageRoute(const VerifyEmailPage());
    case CompleteProfilePage.routeName:
      return _genPageRoute(const CompleteProfilePage());
  }
  return null;
}
