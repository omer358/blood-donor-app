import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../presentation/screens/completeSignUp.dart';
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
    } catch (e) {
      _handleAuthError(e);
    } finally {
      isLoading(false);
    }
  }

// After registration
  Future<void> registerWithEmailAndPassword() async {
    await _handleAuthOperation(() async {
      await _authService.signUpWithEmail(email.value, password.value);
      Get.to(() => const CompleteSignup());
    }, 'تم إنشاء الحساب بنجاح!');
  }

// After login (if needed for incomplete profiles)
  Future<void> loginWithEmailAndPassword() async {
    await _handleAuthOperation(() async {
      await _authService.signInWithEmail(email.value, password.value);
      bool isComplete = await _authService.isProfileComplete();
      log(isComplete.toString());
      if (isComplete) {
        log("the signup is completed");
        Get.off(() => HomeScreen()); // Navigate to HomeScreen if profile is complete
      } else {
        log("the signup is not completed");
        Get.off(() => const CompleteSignup()); // Navigate to CompleteSignup if profile is incomplete
      }
    }, 'تم تسجيل الدخول بنجاح');
  }

// Sign in with Google
  Future<void> signInWithGoogle() async {
    await _handleAuthOperation(() async {
      bool success = await _authService.signInWithGoogle();
      if (!success) {
        throw Exception('Google Sign-in failed.');
      }

      // Check if the profile is complete
      bool isComplete = await _authService.isProfileComplete();
      if (isComplete) {
        log("the signup is completed");
        Get.off(() => HomeScreen()); // Navigate to HomeScreen if profile is complete
      } else {
        log("the signup is not completed");
        Get.off(() => const CompleteSignup()); // Navigate to CompleteSignup if profile is incomplete
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
