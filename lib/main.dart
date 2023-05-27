import 'package:flutter/material.dart';
import 'package:stackivy_ardilla/ui/pages/splash/splash_screen.dart';
import 'package:stackivy_ardilla/ui/utils/colors.dart';
import 'package:stackivy_ardilla/ui/utils/navi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ardilla',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "CabinetGrotesk",
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.w500)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(AppColors.primary)))),
      onGenerateRoute: onGenRoutes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
