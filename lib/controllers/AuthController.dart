import 'package:blood_donor/presentation/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register with email and password
  Future<void> registerWithEmailAndPassword() async {
    try {
      isLoading(true);

      // Attempt to create a user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      // Check if user was successfully created
      if (userCredential.user != null) {
        Get.snackbar('Success', 'Registration completed successfully');
        Get.to(() => const HomeScreen()); // Navigate to HomeScreen
      } else {
        // Handle case where registration did not complete as expected
        Get.snackbar('Error', 'Registration failed. Please try again.');
      }

    } catch (e) {
      Get.snackbar('Error', e.toString().split("]")[1]);
    } finally {
      isLoading(false);
    }
  }

  // Login with email and password
  Future<void> loginWithEmailAndPassword() async {
    try {
      isLoading(true);

      // Attempt to sign in the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      // Check if login was successful
      if (userCredential.user != null) {
        Get.snackbar('Success', 'Login successful');
        Get.to(() => const HomeScreen()); // Navigate to HomeScreen
      } else {
        // Handle case where login did not complete as expected
        Get.snackbar('Error', 'Login failed. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString().split("]")[1]);
    } finally {
      isLoading(false);
    }
  }
}
