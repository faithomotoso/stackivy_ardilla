import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/core/data/repositories/auth_repository.dart';

class AuthVM extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
}