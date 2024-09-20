enum BloodType {
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  oPositive,
  oNegative,
}

extension BloodTypeExtension on BloodType {
  String get displayName {
    switch (this) {
      case BloodType.aPositive:
        return 'A+';
      case BloodType.aNegative:
        return 'A-';
      case BloodType.bPositive:
        return 'B+';
      case BloodType.bNegative:
        return 'B-';
      case BloodType.abPositive:
        return 'AB+';
      case BloodType.abNegative:
        return 'AB-';
      case BloodType.oPositive:
        return 'O+';
      case BloodType.oNegative:
        return 'O-';
      default:
        return '';
    }
  }

  // Method to convert displayName back to BloodType enum
  static BloodType? fromDisplayName(String displayName) {
    for (BloodType type in BloodType.values) {
      if (type.displayName == displayName) {
        return type;
      }
    }
    return null; // Return null if no matching BloodType is found
  }
}
