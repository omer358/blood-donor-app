import 'package:blood_donor/presentation/screens/completeSignUp.dart';
import 'package:blood_donor/presentation/screens/home.dart';
import 'package:blood_donor/presentation/screens/login.dart';
import 'package:blood_donor/service/notification_service.dart';
import 'package:blood_donor/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'service/auth_service.dart';

void main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      locale: const Locale('ar'),
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: MaterialTheme.darkScheme(),
        useMaterial3: true
      ),
      home: const AuthWrapper(), // Use the new AuthWrapper for dynamic routing
    );
  }
}

// This widget will listen to the authentication state and navigate accordingly
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: AuthService().authStateChanges, // Listen to auth state changes
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while waiting for the authentication state
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            // The user is logged in, check if the profile is complete
            return FutureBuilder<bool>(
              future: AuthService().isProfileComplete(),
              builder: (context, profileSnapshot) {
                if (profileSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  // Show a loading spinner while checking profile completeness
                  return const Center(child: CircularProgressIndicator());
                }

                if (profileSnapshot.hasData && profileSnapshot.data == true) {
                  // Navigate to the HomeScreen if the profile is complete
                  return  HomeScreen();
                } else {
                  // Navigate to CompleteSignup if the profile is incomplete
                  return const CompleteSignup();
                }
              },
            );
          } else {
            // The user is not logged in, navigate to the LoginScreen
            return LoginScreen();
          }
        },
      ),
    );
  }
}
