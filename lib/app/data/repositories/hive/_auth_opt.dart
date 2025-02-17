import 'package:hive_flutter/hive_flutter.dart';

class AuthOptions {
  Future<void> saveSession(String uid, String email, String name) async {
    final box = await Hive.openBox('authBox');
    await box.put('user', {
      'uid': uid,
      'name': name,
      'email': email,
    });
  }
}
