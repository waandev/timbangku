import 'package:flutter/material.dart';

class EditProfileUserPage extends StatefulWidget {
  const EditProfileUserPage({super.key});

  @override
  State<EditProfileUserPage> createState() => _EditProfileUserPageState();
}

class _EditProfileUserPageState extends State<EditProfileUserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EAEA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ======================= HEADER ===========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF1E7B34), // hijau
            ),
            child: const Text(
              "Profil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ======================= ICON PROFILE ======================
          Center(
            child: Column(
              children: [
                const Icon(Icons.person, size: 80, color: Colors.orange),
                const SizedBox(height: 10),

                const Text(
                  "Nama",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                // ============ BUTTON EDIT PROFILE ====================
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // ======================= FORM ==============================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Informasi Pribadi :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 15),

                buildInputRow("Nama", nameController),
                buildInputRow("Jenis Kelamin", genderController),
                buildInputRow("Alamat", addressController),
                buildInputRow("Alamat Email", emailController),

                const SizedBox(height: 25),

                // ======================= BUTTONS =======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CANCEL button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 20),

                    // SAVE button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E7B34), // hijau
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {
                        // TODO: Simpan ke backend
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data berhasil disimpan"),
                          ),
                        );
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ======================== FORM ROW WIDGET ========================
  Widget buildInputRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 110,
            child: Text("$label  :", style: const TextStyle(fontSize: 14)),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              enabled: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF6F6F6),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
