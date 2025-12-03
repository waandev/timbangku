import 'package:flutter/material.dart';

class DetailDataPage extends StatelessWidget {
  const DetailDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================================
              // HEADER
              // ================================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                color: const Color(0xFF1C6B2C),
                child: const Center(
                  child: Text(
                    "Profil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ================================
              // LOGO & TIMBANGKU
              // ================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/timbangku_text.png", width: 160),

                  const SizedBox(width: 15),

                  Image.asset("assets/images/logo_timbangku.png", width: 80),
                ],
              ),

              const SizedBox(height: 10),

              // ================================
              // ID UNIT & TANGGAL
              // ================================
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "ID_unit :",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "10.35, rabu 29-10-2025",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Garis tipis pembatas
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 1,
                color: Colors.grey.shade300,
              ),

              const SizedBox(height: 15),

              // ================================
              // DETAIL INFORMASI
              // ================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    _infoRow("Nama"),
                    _infoRow("Jenis Kelamin"),
                    _infoRow("Tanggal Lahir"),
                    _infoRow("Usia"),
                    _infoRow("Alamat"),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Garis tipis lagi
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 1,
                color: Colors.grey.shade300,
              ),

              const SizedBox(height: 20),

              // ================================
              // TOMBOL-TOMBOL
              // ================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _menuButton("Tinggi Badan"),
                  _menuButton("Berat Badan"),
                ],
              ),

              const SizedBox(height: 20),

              // Tombol Perhitungan BMI
              Container(
                width: 260,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C6B2C),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Perhitungan BMI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ================================
  // REUSABLE WIDGETS
  // ================================

  Widget _infoRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$label : ",
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(String text) {
    return Container(
      width: 140,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1C6B2C),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
