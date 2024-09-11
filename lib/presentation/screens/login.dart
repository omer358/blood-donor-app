import 'package:blood_donor/presentation/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                _buildHeaderText(),
                const SizedBox(height: 20),
                _buildSvgImage(),
                const SizedBox(
                  height: 20,
                ),
                _buildEmailTextField(),
                const SizedBox(height: 10,),
                _buildPasswordTextField(),
                const SizedBox(
                  height: 20,
                ),
                _buildSignUpButton(),
                const SizedBox(
                  height: 10,
                ),
                _buildGoogleSignInButton(),
                const SizedBox(
                  height: 10,
                ),
                _buildSignInButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        "تسجيل الدخول",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      "assets/images/sign_in.svg",
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        authController.email.value = value; // Bind input to controller
      },
      decoration: InputDecoration(
        hintText: 'example@example.com',
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      onChanged: (value) {
        authController.password.value = value; // Bind input to controller
      },
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            authController.loginWithEmailAndPassword();
          },
          child: const Text(
            "تسجيل الدخول",
            style: TextStyle(fontSize: 20),
          ),
        ));
  }


  Widget _buildSignInButton() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("ليس لديك حساب؟"),
          TextButton(
              onPressed: () {
                Get.off(SignUpScreen());
              },
              child: const Text("إنشاء حساب"))
        ],
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return Column(
      children: [
        const Text("Or"),
        SizedBox(
          width: 200,
          height: 50,
          child: IconButton(
            icon: Image.asset("assets/images/google_icon.png"),
            onPressed: () {
              authController.signInWithGoogle(); // Trigger Google Sign-In
            },
          ),
        ),
      ],
    );
  }
}