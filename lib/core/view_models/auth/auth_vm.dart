import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/core/data/repositories/auth_repository.dart';
import 'package:stackivy_ardilla/ui/utils/loading_indicator.dart';
import 'package:stackivy_ardilla/ui/utils/utils.dart';

import '../../../ui/pages/auth/verify_email_page.dart';

class AuthVM extends ChangeNotifier {
  String? _initSignUpEmail;
  final AuthRepository _authRepository = AuthRepository();

  Future<void> initSignUp({required BuildContext context, required String email}) async {
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
}
