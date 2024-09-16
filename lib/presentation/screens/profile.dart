import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';
import '../../models/blood_type.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          if (_profileController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextField(
                  label: 'First Name',
                  controller: _profileController.firstNameController,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  label: 'Last Name',
                  controller: _profileController.lastNameController,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  label: 'Address',
                  controller: _profileController.addressController,
                ),
                const SizedBox(height: 10),
                _buildBloodTypeDropdown(_profileController),
                const SizedBox(height: 10),
                _buildTextField(
                  label: 'Profession',
                  controller: _profileController.professionController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _profileController.updateUserProfile();
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // Modified to include a dropdown for Blood Type selection
  Widget _buildBloodTypeDropdown(ProfileController controller) {
    return Obx(() {
      return DropdownButtonFormField<BloodType>(
        value: controller.selectedBloodType.value,
        items: BloodType.values.map((bloodType) {
          return DropdownMenuItem<BloodType>(
            value: bloodType,
            child: Text(bloodType.displayName),
          );
        }).toList(),
        onChanged: (BloodType? newValue) {
          controller.selectedBloodType.value = newValue!;
        },
        decoration: InputDecoration(
          labelText: 'Blood Type',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      );
    });
  }

}
