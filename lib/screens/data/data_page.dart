import 'package:flutter/material.dart';
import 'detaildata_page.dart';
import 'inputdata_page.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  // ====== DATA DUMMY ======
  List<Map<String, String>> dataList = [
    {"nama": "Ryan Hidayat", "tanggal": "10:35 / Rabu"},
    {"nama": "A. Alfiansyah", "tanggal": "11:20 / Kamis"},
    {"nama": "Fani Fanila", "tanggal": "09:50 / Senin"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1C6B2C),
        title: const Text("Data", style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        children: [
          const SizedBox(height: 8),

          // ================= HEADER =================
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            color: Colors.white,
            child: Row(
              children: const [
                Expanded(flex: 3, child: Text("Nama", style: headerStyle)),
                Expanded(flex: 3, child: Text("Tanggal", style: headerStyle)),
                Expanded(flex: 2, child: Text("Kelola", style: headerStyle)),
              ],
            ),
          ),

          // ================= LIST DATA =================
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final item = dataList[index];

                  return GestureDetector(
                    onTap: () {
                      // TEKAN DATA → DetailDataPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailDataPage(
                            nama: item["nama"]!,
                            tanggal: item["tanggal"]!,
                          ),
                        ),
                      );
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFE0E0E0),
                            width: 1,
                          ),
                        ),
                      ),

                      child: Row(
                        children: [
                          // ================= NAMA =================
                          Expanded(
                            flex: 3,
                            child: Text(
                              item["nama"]!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),

                          // ================= TANGGAL =================
                          Expanded(
                            flex: 3,
                            child: Text(
                              item["tanggal"]!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),

                          // ================= K E L O L A =================
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                // ====== EDIT → InputDataPage ======
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => InputDataPage(
                                          existingData: item, // <<< FIX AMAN
                                        ),
                                      ),
                                    );

                                    if (result != null) {
                                      setState(() {
                                        dataList[index]["nama"] =
                                            result["nama"];
                                        dataList[index]["tanggal"] =
                                            result["tanggal"];
                                      });
                                    }
                                  },
                                ),

                                // ====== HAPUS ======
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    _hapusData(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // =================== FUNGSI HAPUS DATA ===================
  void _hapusData(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Data"),
          content: const Text("Apakah Anda yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  dataList.removeAt(index);
                });
              },
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

const headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.orange,
  fontSize: 15,
);
