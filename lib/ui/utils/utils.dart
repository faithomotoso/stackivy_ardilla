import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

const double horizontalPadding = 20.0;

String getFullSvgPath({required String iconName}) {
  return "assets/svgs/$iconName";
}

String getFullImagePath({required String imageName}) {
  return "assets/images/$imageName";
}

void showSnackbar({required String content, Color? color}) {
  scaffoldKey.currentState!.showSnackBar(SnackBar(
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: color,
  ));
}

void showSuccessSnackbar({required String content}) {
  showSnackbar(content: content, color: Colors.green);
}

void showErrorSnackbar({required String content}) {
  showSnackbar(content: content, color: Colors.red);
}

Future<bool> appLaunchUrl({required String url}) async {
  try {
    Uri uri = Uri.parse(url);
    return await urlLauncher.launchUrl(uri);
  } catch (e) {
    log("Error launching url -> $url");
    return false;
  }
}
