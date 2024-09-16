import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/blood_type.dart';
import '../service/auth_service.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  var selectedBloodType = BloodType.aPositive.obs; // Default selection
  final professionController = TextEditingController();

  var isLoading = false.obs;

  final AuthService _authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  // Fetch user profile from Firestore
  Future<void> fetchUserProfile() async {
    isLoading(true);
    try {
      final userProfile = await _authService.getUserProfile();
      if (userProfile != null) {
        firstNameController.text = userProfile['firstName'] ?? '';
        lastNameController.text = userProfile['lastName'] ?? '';
        addressController.text = userProfile['address'] ?? '';
        selectedBloodType.value = userProfile['bloodType'] ?? '';
        professionController.text = userProfile['profession'] ?? '';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch profile');
    } finally {
      isLoading(false);
    }
  }

  // Update user profile in Firestore
  Future<void> updateUserProfile() async {
    isLoading(true);
    try {
      await _authService.updateUserProfile(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        address: addressController.text,
        bloodType: selectedBloodType.value.displayName,
        profession: professionController.text,
      );
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile');
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    professionController.dispose();
    super.dispose();
  }
}
