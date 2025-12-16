import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref(
    'scale01/history',
  );

  List<Map<String, String>> historyList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    _dbRef.onValue.listen((event) {
      final data = event.snapshot.value;

      final List<Map<String, String>> tempList = [];

      if (data is Map) {
        data.forEach((key, value) {
          if (value != null) {
            tempList.add({
              'key': key.toString(),
              'nama': value['nama']?.toString() ?? '-',
              'umur': value['umur']?.toString() ?? '-',
              'jenis_kelamin': value['jenis_kelamin']?.toString() ?? '-',
              'tanggal_lahir': value['tanggal_lahir']?.toString() ?? '-',
            });
          }
        });
      } else if (data is List) {
        for (int i = 0; i < data.length; i++) {
          final value = data[i];
          if (value != null) {
            tempList.add({
              'key': i.toString(),
              'nama': value['nama']?.toString() ?? '-',
              'umur': value['umur']?.toString() ?? '-',
              'jenis_kelamin': value['jenis_kelamin']?.toString() ?? '-',
              'tanggal_lahir': value['tanggal_lahir']?.toString() ?? '-',
            });
          }
        }
      }

      if (mounted) {
        setState(() {
          historyList = tempList;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History Timbangan')),
      body: historyList.isEmpty
          ? const Center(child: Text('Belum ada data'))
          : ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                final item = historyList[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(item['nama'] ?? '-'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Umur: ${item['umur']}'),
                        Text('Jenis Kelamin: ${item['jenis_kelamin']}'),
                        Text('Tanggal Lahir: ${item['tanggal_lahir']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
