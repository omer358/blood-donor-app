import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../presentation/screens/home.dart';
import '../service/auth_service.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final AuthService _authService = AuthService();

  // Handle common loading and error handling
  Future<void> _handleAuthOperation(
      Future<void> Function() authOperation, String successMessage) async {
    try {
      isLoading(true);
      await authOperation();
      Get.snackbar('Success', successMessage);
      Get.off(() => const HomeScreen());
    } catch (e) {
      _handleAuthError(e);
    } finally {
      isLoading(false);
    }
  }

  // Register with email and password
  Future<void> registerWithEmailAndPassword() async {
    await _handleAuthOperation(
            () => _authService.signUpWithEmail(email.value, password.value),
        'Registration completed successfully');
  }

  // Login with email and password
  Future<void> loginWithEmailAndPassword() async {
    await _handleAuthOperation(
            () => _authService.signInWithEmail(email.value, password.value),
        'Login successful');
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    await _handleAuthOperation(() async {
      bool success = await _authService.signInWithGoogle();
      if (!success) {
        throw Exception('Google Sign-in failed.');
      }
    }, 'Google Sign-in successful');
  }

  // Handle common auth errors
  void _handleAuthError(Object e) {
    String message;
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          message = 'ليس هنالك مستخدم بهذا البريد.';
          break;
        case 'wrong-password':
          message = 'كلمة السر غير صحيحة';
          break;
        case 'email-already-in-use':
          message = 'البريد الإلكتروني مستخدم بالفعل';
          break;
        case 'invalid-email':
          message = 'هذا البريد غير صالح';
          break;
        case 'account-exists-with-different-credential':
          message = 'الحساب مستخدم';
          break;
        default:
          message = 'حاول مجدداً';
      }
    } else {
      message = 'An unexpected error occurred.';
    }
    Get.snackbar('خطأ', message);
  }
}
