import 'package:flutter/material.dart';
import 'package:timbangku/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimbangKu',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
