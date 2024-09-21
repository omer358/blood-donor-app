import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/completeSignUp.dart';
import '../screens/email_verification.dart';
import '../screens/home.dart';
import '../service/auth_service.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  Timer? _emailVerificationTimer;

  final AuthService _authService = AuthService();

  // Expose currentUser from AuthService
  User? get currentUser => _authService.currentUser;

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


  // After registration
  Future<void> registerWithEmailAndPassword() async {
    await _handleAuthOperation(() async {
      UserCredential userCredential = await _authService.signUpWithEmail(
        email.value,
        password.value,
      );
      Get.to(() => EmailVerificationScreen());
    }, 'تم إنشاء الحساب بنجاح! تحقق من بريدك الإلكتروني.');
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


  // Check if the email is verified
  void checkEmailVerified() async {
    User? user = _authService.currentUser;
    await user?.reload(); // Reload the user to get the updated email verification status

    if (user != null && user.emailVerified) {
      // Stop the timer if email is verified
      _emailVerificationTimer?.cancel();
      // Check if profile is complete and navigate accordingly
      bool isComplete = await _authService.isProfileComplete();
      if (isComplete) {
        log("Email verified and profile complete.");
        Get.off(() => HomeScreen());
      } else {
        log("Email verified but profile is not complete.");
        Get.snackbar("تم التأكيد", "تم تأكيد البريد الإلكتروني");
        Get.off(() => const CompleteSignup());
      }
    }
  }

  // Start a timer to periodically check for email verification
  void startEmailVerificationTimer() {
    _emailVerificationTimer = Timer.periodic(
      const Duration(seconds: 5),
          (timer) => checkEmailVerified(),
    );
  }

  @override
  void onClose() {
    _emailVerificationTimer?.cancel(); // Cancel the timer when controller is disposed
    super.onClose();
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
