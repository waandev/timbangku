import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),

      /// 🔹 AppBar Hijau
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B7D1E),
        title: const Text(
          "Data",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          const SizedBox(height: 8),

          /// 🔹 HEADER TABEL
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Nama",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Tanggal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Kelola",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 ISI DATA
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        /// Nama
                        const Expanded(
                          flex: 3,
                          child: Text(
                            "Ryan Hidayat",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),

                        /// Tanggal
                        const Expanded(
                          flex: 3,
                          child: Text(
                            "10:35 / Rabu",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),

                        /// Kelola
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              /// Edit
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),

                              /// Delete
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          /// 🔹 Tombol Unduh
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Unduh Data",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
