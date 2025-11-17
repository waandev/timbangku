import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _navigateToHomePage();

    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, AppRoutes.home);
    // });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 4));
    _animationController.forward();
    await Future.delayed(const Duration(seconds: 4));
    Get.offNamed('/login');
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
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) {
                return Opacity(opacity: _opacityAnimation.value, child: child);
              },
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
          ),
        ],
      ),
    );
  }
}
