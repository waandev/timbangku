import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔶 ICON ORANG
              Image.asset('assets/images/person.png', width: 130),

              const SizedBox(height: 40),

              // 🔶 USERNAME
              _inputField(hint: "Username", icon: Icons.person),

              // 🔶 EMAIL
              _inputField(
                hint: "Email",
                icon: Icons.email,
                margin: const EdgeInsets.only(top: 18),
              ),

              // 🔶 PASSWORD
              _inputField(
                hint: "Create Password",
                icon: Icons.lock,
                isPassword: true,
                margin: const EdgeInsets.only(top: 18),
              ),

              // 🔶 KONFIRMASI PASSWORD
              _inputField(
                hint: "Confirm Password",
                icon: Icons.lock,
                isPassword: true,
                margin: const EdgeInsets.only(top: 18),
              ),

              const SizedBox(height: 30),

              // 🔶 TOMBOL DAFTAR
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: logika daftar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF128A4A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔶 OPSI LOGIN DI BAWAH TOMBOL DAFTAR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🔶 REUSABLE INPUT FIELD
  Widget _inputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    return Container(
      width: 280,
      margin: margin,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.orange),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
