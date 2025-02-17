import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      // Get data from Firestore
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('db_users').doc(user!.uid).get();

      if (userDoc.exists) {
        // Assuming 'name' is a field in the Firestore document
        return {
          'success': true,
          'message': 'User logged in successfully',
          'user': user, // Convert the User to a map if necessary
          'name': userDoc.data()?['name'] ??
              'No name available', // Fetch 'name' from the Firestore document
        };
      } else {
        // logout
        await _auth.signOut();
        return {
          'success': false,
          'message': 'User not found in Firestore',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
