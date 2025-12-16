import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'detaildata_page.dart';
import 'inputdata_page.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'scale01/history',
  );

  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    _listenData();
  }

  // ================= LISTEN DATA REALTIME =================
  void _listenData() {
    _dbRef.onValue.listen((event) {
      final data = event.snapshot.value;
      final List<Map<String, dynamic>> tempList = [];

      print('SNAPSHOT => $data');

      if (data == null) {
        setState(() => dataList = []);
        return;
      }

      // SUPPORT MAP
      if (data is Map) {
        data.forEach((key, value) {
          if (value != null) {
            tempList.add({
              'id': key.toString(),
              'nama': value['nama'] ?? '-',
              'tanggal': value['tanggal'] ?? '-',
            });
          }
        });
      }
      // SUPPORT LIST
      else if (data is List) {
        for (int i = 0; i < data.length; i++) {
          final value = data[i];
          if (value != null) {
            tempList.add({
              'id': i.toString(),
              'nama': value['nama'] ?? '-',
              'tanggal': value['tanggal'] ?? '-',
            });
          }
        }
      }

      setState(() {
        dataList = tempList.reversed.toList(); // data terbaru di atas
      });
    });
  }

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
              child: dataList.isEmpty
                  ? const Center(
                      child: Text(
                        "Belum ada data",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final item = dataList[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailDataPage(
                                  nama: item["nama"],
                                  tanggal: item["tanggal"],
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
                                    item["nama"],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),

                                // ================= TANGGAL =================
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    item["tanggal"],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),

                                // ================= KELOLA =================
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      // ===== EDIT =====
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
                                                existingData: item,
                                              ),
                                            ),
                                          );

                                          if (result != null) {
                                            _dbRef.child(item['id']).update({
                                              'nama': result['nama'],
                                              'tanggal': result['tanggal'],
                                            });
                                          }
                                        },
                                      ),

                                      // ===== DELETE =====
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          _hapusData(item['id']);
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

  // ================= HAPUS DATA =================
  void _hapusData(String id) {
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
                _dbRef.child(id).remove();
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
