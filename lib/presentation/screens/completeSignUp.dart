import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';
import '../../models/blood_type.dart';

class CompleteSignup extends StatelessWidget {
  const CompleteSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

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
                const SizedBox(height: 20),
                _buildTextField('First Name', controller.firstName),
                const SizedBox(height: 10),
                _buildTextField('Last Name', controller.lastName),
                const SizedBox(height: 10),
                _buildTextField('Address', controller.address),
                const SizedBox(height: 10),
                _buildBloodTypeDropdown(controller),
                const SizedBox(height: 10),
                _buildTextField('Profession', controller.profession),
                const SizedBox(height: 10),
                _buildTextField('Phone Number', controller.phoneNumber),
                const SizedBox(height: 20),
                _buildCompleteSignupButton(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Text(
      "بيانات المُتبرع",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      "assets/images/info.svg",
      width: 130,
      height: 130,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextField(String label, RxString controllerValue) {
    return TextField(
      onChanged: (value) {
        controllerValue.value = value; // Bind input to controller
      },
      decoration: InputDecoration(
        labelText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _buildCompleteSignupButton(SignupController controller) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: controller.completeSignup,
        child: const Text(
          "Complete",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  // Modified to include a dropdown for Blood Type selection
  Widget _buildBloodTypeDropdown(SignupController controller) {
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
