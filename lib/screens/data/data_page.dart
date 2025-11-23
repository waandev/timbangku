import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  // Dummy data
  final List<Map<String, String>> dataList = List.generate(7, (i) {
    return {"nama": "Ryan Hidayat", "tanggal": "10.35 / Rabu / ...."};
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================================
              // HEADER (sesuai tampilan Home)
              // ================================
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png", // pastikan file ada
                      width: 180,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ================================
              // CARD PUTIH BERISI TABEL
              // ================================
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Data Anak",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF128A4A),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Table(
                      border: TableBorder.all(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(1.3),
                      },
                      children: [
                        // HEADER
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Color(0xFFF6F6F6),
                          ),
                          children: [
                            _headerCell("Nama"),
                            _headerCell("Tanggal"),
                            _headerCell("Aksi"),
                          ],
                        ),

                        // LIST DATA
                        ...dataList.map((item) {
                          return TableRow(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              _cellText(item["nama"]!),
                              _cellText(item["tanggal"]!),
                              _cellIcons(),
                            ],
                          );
                        }).toList(),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // ================================
                    // TOMBOL UNDUH
                    // ================================
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Unduh",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ===================================
  // REUSABLE WIDGETS
  // ===================================
  Widget _headerCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _cellText(String text) {
    return Padding(padding: const EdgeInsets.all(10), child: Text(text));
  }

  Widget _cellIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit, color: Colors.orange, size: 18),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
        ),
      ],
    );
  }
}
