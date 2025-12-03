import 'package:flutter/material.dart';

class InputDataPage extends StatefulWidget {
  final Map<String, dynamic>? existingData; // null = tambah, ada = edit

  const InputDataPage({super.key, this.existingData});

  @override
  State<InputDataPage> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<InputDataPage> {
  late TextEditingController namaController;
  late TextEditingController jkController;
  late TextEditingController ttlController;
  late TextEditingController usiaController;
  late TextEditingController alamatController;

  String tinggi = "-";
  String berat = "-";
  String bmi = "-";

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.existingData?["nama"] ?? "",
    );
    jkController = TextEditingController(
      text: widget.existingData?["jk"] ?? "",
    );
    ttlController = TextEditingController(
      text: widget.existingData?["ttl"] ?? "",
    );
    usiaController = TextEditingController(
      text: widget.existingData?["usia"] ?? "",
    );
    alamatController = TextEditingController(
      text: widget.existingData?["alamat"] ?? "",
    );

    /// Jika edit data → isi nilai tinggi/berat/bmi bila ada
    tinggi = widget.existingData?["tinggi"] ?? "-";
    berat = widget.existingData?["berat"] ?? "-";
    bmi = widget.existingData?["bmi"] ?? "-";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF128A4A),
        title: Text(
          widget.existingData == null ? "Input Data" : "Edit Data",
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // -----------------------------------------------------
            // 🔶 FORM INPUT
            // -----------------------------------------------------
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF128A4A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildInputRow("Nama", "Masukkan Nama", namaController),
                  const SizedBox(height: 10),

                  _buildInputRow(
                    "Jenis Kelamin",
                    "Jenis kelamin",
                    jkController,
                  ),
                  const SizedBox(height: 10),

                  _buildInputRow("Tanggal Lahir", "HH/BB/TT", ttlController),
                  const SizedBox(height: 10),

                  _buildInputRow("Usia", "Usia sekarang", usiaController),
                  const SizedBox(height: 10),

                  _buildInputRow("Alamat", "Alamat lengkap", alamatController),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      // nanti ganti dengan sensor IoT
                      setState(() {
                        tinggi = "90 cm";
                        berat = "12 kg";
                        bmi = "17.3";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Ukur",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // -----------------------------------------------------
            // 🔶 HASIL (TINGGI, BERAT, BMI)
            // -----------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _boxResult("Tinggi:\n$tinggi"),
                const SizedBox(width: 10),
                _boxResult("BMI:\n$bmi", size: 120),
              ],
            ),

            const SizedBox(height: 10),
            _boxResult("Berat:\n$berat"),

            const SizedBox(height: 40),

            // -----------------------------------------------------
            // 🔶 BUTTON SAVE / UPDATE
            // -----------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔙 KEMBALI
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF128A4A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Kembali",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(width: 20),

                // 💾 SAVE / UPDATE
                ElevatedButton(
                  onPressed: () {
                    final newData = {
                      "nama": namaController.text,
                      "jk": jkController.text,
                      "ttl": ttlController.text,
                      "usia": usiaController.text,
                      "alamat": alamatController.text,
                      "tinggi": tinggi,
                      "berat": berat,
                      "bmi": bmi,
                    };

                    Navigator.pop(context, newData);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    widget.existingData == null ? "Save" : "Update",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // 🔧 INPUT FIELD
  // ==========================================================
  Widget _buildInputRow(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            "$label :",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // 🔧 BOX HASIL PENGUKURAN
  // ==========================================================
  Widget _boxResult(String title, {double size = 150}) {
    return Container(
      width: size,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
