import 'package:flutter/material.dart';
import 'package:timbangku/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          // ---- Konten Utama di Tengah ----
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Timbang',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Ku',
                        style: TextStyle(color: Color(0xFF128A4A)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Timbang, Pantau, dan Capai Berat idealmu!',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ---- Teks di Paling Bawah ----
          const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Text(
              'Developed by TIMBangKit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
