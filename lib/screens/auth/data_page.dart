import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  int _selectedIndex = 2; // posisi "Data"

  // Contoh data dummy
  final List<Map<String, String>> dataList = List.generate(7, (i) {
    return {"nama": "A. alfiansyah", "tanggal": "10.35/Rabu/...."};
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E4E4),

      body: SafeArea(
        child: Column(
          children: [
            // ===========================
            // HEADER
            // ===========================
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              color: Color(0xFF1C6B2C), // Hijau header
              child: Text(
                "Data",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ===========================
            // LIST DATA (TABEL)
            // ===========================
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1.2),
                  },
                  children: [
                    // HEADER TABEL
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white),
                      children: [
                        _headerCell("Nama"),
                        _headerCell("Tanggal"),
                        _headerCell("Kelola"),
                      ],
                    ),

                    // DAFTAR DATA
                    ...dataList.map((item) {
                      return TableRow(
                        decoration: BoxDecoration(color: Colors.white),
                        children: [
                          _cellText(item["nama"]!),
                          _cellText(item["tanggal"]!),
                          _cellIcons(),
                        ],
                      );
                    }).toList(),

                    // RUANG KOSONG DI BAWAH
                    TableRow(
                      children: [
                        SizedBox(height: 100),
                        SizedBox(height: 100),
                        SizedBox(height: 100),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ===========================
            // TOMBOL UNDUH
            // ===========================
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
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

      // ===========================
      // BOTTOM NAVIGATION
      // ===========================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          // TODO: Tambahkan navigasi antar halaman
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Data'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // ===========================
  // WIDGET REUSABLE
  // ===========================
  Widget _headerCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
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
          icon: Icon(Icons.edit, color: Colors.orange),
          iconSize: 18,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete, color: Colors.red),
          iconSize: 20,
        ),
      ],
    );
  }
}
