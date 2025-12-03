import 'package:flutter/material.dart';

class DetailDataPage extends StatelessWidget {
  final String nama;
  final String tanggal;

  const DetailDataPage({super.key, required this.nama, required this.tanggal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),

      body: Column(
        children: [
          // =====================================
          // HEADER FULL HIJAU
          // =====================================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 45),
            color: const Color(0xFF1C6B2C),
            child: const Center(
              child: Text(
                "Data Detail",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // =====================================
          // BODY SCROLLABLE
          // =====================================
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // ---------- LOGO ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/timbangku.png", width: 160),
                      const SizedBox(width: 15),
                      Image.asset("assets/images/logo.png", width: 80),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ---------- TANGGAL ----------
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tanggal, // <==== MENGGUNAKAN DATA DARI LIST
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),

                  // Garis pembatas
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 1,
                    color: Colors.grey.shade300,
                  ),

                  const SizedBox(height: 15),

                  // =====================================
                  // DETAIL INFORMASI
                  // =====================================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoRow("Nama", nama), // <==== menampilkan nilai
                        _infoRow("Jenis Kelamin", "-"),
                        _infoRow("Tanggal Lahir", "-"),
                        _infoRow("Usia", "-"),
                        _infoRow("Alamat", "-"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Garis pembatas
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 1,
                    color: Colors.grey.shade300,
                  ),

                  const SizedBox(height: 20),

                  // =====================================
                  // 2 TOMBOL
                  // =====================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _menuButton("Tinggi Badan"),
                      _menuButton("Berat Badan"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // =====================================
                  // BMI BUTTON
                  // =====================================
                  SizedBox(
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
        ],
      ),
    );
  }

  // ============================================================
  // REUSABLE WIDGETS
  // ============================================================

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$label : ",
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(String text) {
    return SizedBox(
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
