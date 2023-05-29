import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DashboardVM extends ChangeNotifier {
  final GlobalKey<SliderDrawerState> _drawerKey = GlobalKey();

  GlobalKey<SliderDrawerState> get drawerKey => _drawerKey;

  int _selectedNavbarIndex = 0;

  int get selectedNavbarIndex => _selectedNavbarIndex;

  void openDrawer() {
    _drawerKey.currentState!.openSlider();
  }

  void closeDrawer() {
    _drawerKey.currentState!.closeSlider();
  }

  void toggleDrawer() {
    _drawerKey.currentState!.toggle();
  }

  void setNavbarIndex(int i) {
    _selectedNavbarIndex = i;
    notifyListeners();
  }
}