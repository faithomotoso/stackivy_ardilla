import 'package:stackivy_ardilla/ui/utils/utils.dart';

class OnboardingItem {
  String imageName;
  String titleText;
  String subtitleText;

  OnboardingItem(
      {required this.imageName,
      required this.titleText,
      required this.subtitleText}) {
    imageName = getFullImagePath(imageName: imageName);
  }
}
