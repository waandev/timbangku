import 'package:firebase_database/firebase_database.dart';

class FirebaseTest {
  static final DatabaseReference _db = FirebaseDatabase.instance.ref();

  static Future<void> testConnection() async {
    try {
      final snapshot = await _db.child('scale01/history/0').get();

      if (snapshot.exists) {
        print('✅ FIREBASE TERHUBUNG');
        print(snapshot.value);
      } else {
        print('❌ DATA TIDAK DITEMUKAN');
      }
    } catch (e) {
      print('🔥 ERROR FIREBASE: $e');
    }
  }
}
