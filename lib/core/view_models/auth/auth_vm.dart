import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/core/data/repositories/auth_repository.dart';
import 'package:stackivy_ardilla/core/models/user.dart';
import 'package:stackivy_ardilla/ui/pages/dashboard/dashboard.dart';
import 'package:stackivy_ardilla/ui/utils/loading_indicator.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

import '../../../ui/pages/auth/verify_email_page.dart';

class AuthVM extends ChangeNotifier {
  User? _user;
  String? _initSignUpEmail;
  final AuthRepository _authRepository = AuthRepository();

  User? get user => _user;

  Future<void> initSignUp({
    required BuildContext context,
    required String email,
  }) async {
    try {
      showLoadingIndicator(context: context);

      await _authRepository.signUpStart(emailAddress: email);
      _initSignUpEmail = email;

      Navigator.pop(context);
      navigatorKey.currentState!.pushNamed(VerifyEmailPage.routeName);
    } catch (e) {
      Navigator.pop(context);
      showErrorSnackbar(content: e.toString());
    }
  }

  Future<void> completeProfile(
      {required BuildContext context,
      required String userName,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password,
      String? inviteCode}) async {
    try {
      showLoadingIndicator(context: context);
      await _authRepository.completeProfile(
          userName: userName,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          password: password,
          inviteCode: inviteCode);
      _user = User(
          firstName: firstName, lastName: lastName, usernameOrEmail: userName);

      Navigator.pop(context);

      // Remove everything from the route
      navigatorKey.currentState!.popUntil((route) => true);
      navigatorKey.currentState!.pushReplacementNamed(Dashboard.routeName);
    } catch (e) {
      Navigator.pop(context);
      showErrorSnackbar(content: e.toString());
    }
  }
}
