import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1C6B2C),
        title: const Text(
          "Profil",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// Foto / Icon Profile
              Image.asset(
                'assets/images/person.png',
                width: 120,
                color: Colors.orange,
              ),

              const SizedBox(height: 10),

              /// Nama User
              const Text(
                "Nama",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 40),

              /// 🔹 Alamat Email (tetap ditampilkan)
              const Text(
                "Alamat Email",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
