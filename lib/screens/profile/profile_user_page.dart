import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),

      /// 🔹 AppBar Hijau (seperti di contoh gambar)
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B7D1E),
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

              /// 🔹 Foto / Icon Profile
              Image.asset(
                'assets/images/person.png',
                width: 120,
                color: Colors.orange,
              ),

              const SizedBox(height: 10),

              const Text(
                "Nama",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 20),

              /// 🔹 Tombol Edit Profile
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              /// 🔹 Menu Informasi Pribadi
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Informasi Pribadi",
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 Menu Email
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Alamat Email",
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
