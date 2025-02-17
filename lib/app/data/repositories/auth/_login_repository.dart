import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        return {
          'success': true,
          'message': 'User logged in successfully',
        };
      } else {
        return {
          'success': false,
          'message': 'User not logged in',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }
}