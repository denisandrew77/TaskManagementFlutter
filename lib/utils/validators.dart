/// Validation utilities for forms
class Validators {
  Validators._(); // Private constructor

  /// Validates if a string is not empty
  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  /// Validates email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email address';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates phone number format
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }

    // Basic validation - at least 10 digits
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Validates passport number
  static String? validatePassport(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter passport number';
    }

    if (value.length < 6) {
      return 'Passport number must be at least 6 characters';
    }

    return null;
  }

  /// Validates passenger name
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter passenger name';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }
}
