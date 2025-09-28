class Validators {
  static String? requiredField(String? value, String message) {
    if (value == null || value.isEmpty) return message;
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!value.contains('@')) return 'Enter a valid email';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 chars';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return 'Please confirm password';
    if (value != password) return 'Passwords do not match';
    return null;
  }

  static String? firstName(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your first name';
    if (value.length < 2) return 'First name must be at least 2 characters';
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your last name';
    if (value.length < 2) return 'Last name must be at least 2 characters';
    return null;
  }
}
