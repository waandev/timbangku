import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // 🔶 LOGO DAN JUDUL
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/timbangku.png', width: 220),
                  const SizedBox(width: 10),
                  Image.asset('assets/images/logo.png', width: 120),
                ],
              ),

              const SizedBox(height: 10),

              Container(
                height: 2,
                width: double.infinity,
                color: Colors.grey.shade400,
              ),

              const SizedBox(height: 20),

              // 🔶 Card Input Data
              _imageCard(
                imagePath: 'assets/images/foto1.jpg',
                buttonText: 'Input Data',
                onPressed: () {
                  // TODO: pindah ke halaman input
                },
              ),

              const SizedBox(height: 20),

              // 🔶 Card Data terbaru + tombol edit
              _dataCard(
                imagePath: 'assets/images/foto2.jpg',
                onEdit: () {
                  // TODO: pindah ke halaman edit data
                },
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // 🔶 BOTTOM NAV BAR TANPA RIWAYAT
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Data'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // =====================================================
  // 🔶 CARD 1 : IMAGE + BUTTON
  // =====================================================
  Widget _imageCard({
    required String imagePath,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 330,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================
  // 🔶 CARD 2 : DATA TERBARU + TOMBOL EDIT
  // =====================================================
  Widget _dataCard({required String imagePath, required VoidCallback onEdit}) {
    return Container(
      width: 330,
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFF3F6F5E),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          // TEXT DATA
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Data terbaru :\n\n"
                    "Nama :\n"
                    "Umur :\n"
                    "Jenis Kelamin :\n"
                    "Jam :",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Edit Data",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // GAMBAR
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            child: Image.asset(
              imagePath,
              height: 180,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
