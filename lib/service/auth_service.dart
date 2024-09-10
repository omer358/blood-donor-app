import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in with email and password
  Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Signed in: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      throw Exception("Email sign-in failed: ${e.message}");
    }
  }

  // Register with email and password
  Future<void> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Account created: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      throw Exception("Email sign-up failed: ${e.message}");
    }
  }

  // Save user data to Firestore
  Future<void> saveUserData(String firstName, String lastName, String address, String bloodType, String profession) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'bloodType': bloodType,
        'profession': profession,
        'email': user.email,
      });
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
