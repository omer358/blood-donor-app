import 'dart:developer';

import 'package:blood_donor/models/blood_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Listen to auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get the current user
  User? get currentUser => _auth.currentUser;

  // Sign in with email and password
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Register with email and password
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Send email verification after registration
    await verifyEmail();

    return userCredential;
  }

  // Save user data to Firestore
  Future<void> saveUserData(String firstName, String lastName, String address, BloodType bloodType, String profession) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'bloodType': bloodType.displayName,
        'profession': profession,
        'email': user.email,
      });
    }
  }

  // Check if the user profile is complete
  Future<bool> isProfileComplete() async {
    User? user = _auth.currentUser;
    if (user != null) {
      log("the user is not null");
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        log("the userDocs exists");
        return true;
      } else {
        return false;
      }
    }
    log("the user is null");
    return false; // Profile is incomplete if the document doesn't exist
  }

  // Sign in with Google
  Future<bool> signInWithGoogle() async {
    // Trigger the Google Authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      // User canceled the sign-in process
      return false;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with the credential
    await _auth.signInWithCredential(credential);
    return true;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Check if the user is signed in (helper method)
  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  // Send email verification
  Future<void> verifyEmail() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      try {
        await user.sendEmailVerification();
        log("Verification email sent.");
      } catch (e) {
        log("Error sending email verification: $e");
      }
    }
  }

  // Check if email is verified
  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload(); // Reload the user data to ensure the latest status
    return user?.emailVerified ?? false;
  }

  // Fetch user profile from Firestore
  Future<Map<String, dynamic>?> getUserProfile() async {
    User? user = currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      return userDoc.data() as Map<String, dynamic>?;
    }
    return null;
  }

  // Update user profile in Firestore
  Future<void> updateUserProfile({
    required String firstName,
    required String lastName,
    required String address,
    required String bloodType,
    required String profession,
  }) async {
    User? user = currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'bloodType': bloodType,
        'profession': profession,
      });
    }
  }
}
