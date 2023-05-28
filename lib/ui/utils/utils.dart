import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

String getFullSvgPath({required String iconName}) {
  return "assets/svgs/$iconName";
}

String getFullImagePath({required String imageName}) {
  return "assets/images/$imageName";
}
