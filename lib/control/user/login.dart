
import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginUser(String email, String password) async {
  try {
    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Login successful
    // You can perform further actions here
    print('Login successful: ${userCredential.user?.email}');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    } else {
      print('Error: ${e.message}');
    }
  }
}