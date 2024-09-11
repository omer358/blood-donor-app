import 'package:blood_donor/models/donor_model.dart';
import 'package:blood_donor/presentation/screens/home.dart';
import 'package:get/get.dart';

import '../service/auth_service.dart';

class SignupController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var address = ''.obs;
  var bloodType = ''.obs;
  var profession = ''.obs;
  var phoneNumber = ''.obs;

  final AuthService _authService = AuthService(); // Connect to AuthService

  Future<void> completeSignup() async {
    try {
      // Create DonorModel from user input
      DonorModel donor = DonorModel(
        firstName: firstName.value,
        lastName: lastName.value,
        address: address.value,
        bloodType: bloodType.value,
        profession: profession.value,
        phoneNumber: phoneNumber.value,
      );

      // Save the user data
      await _authService.saveUserData(
        donor.firstName,
        donor.lastName,
        donor.address,
        donor.bloodType,
        donor.profession,
      );

      // Navigate to Home after completion
      Get.snackbar('Success', 'Signup complete');
      Get.off(()=> HomeScreen());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
