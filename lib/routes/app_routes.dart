import 'package:flutter/material.dart';
import 'package:timbangku/screens/home/home_page.dart';
import 'package:timbangku/screens/splash/splash_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomePage(),
  };
}
