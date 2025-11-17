import 'package:flutter/material.dart';
import 'package:timbangku/screens/auth/login_page.dart';
import 'package:timbangku/screens/auth/register_page.dart';
import 'package:timbangku/screens/home/home_page.dart';
import 'package:timbangku/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan!')),
          ),
        );
    }
  }
}
