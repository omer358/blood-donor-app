import 'package:blood_donor/models/blood_type.dart';

class DonorModel {
  final String firstName;
  final String lastName;
  final String address;
  final BloodType bloodType;
  final String profession;
  final String phoneNumber;

  DonorModel({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.bloodType,
    required this.profession,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'bloodType': bloodType.displayName,
      'profession': profession,
      'phoneNumber': phoneNumber,
    };
  }
}
