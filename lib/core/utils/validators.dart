
import 'package:nha_228/core/constants/app_strings.dart';

extension AppValidators on String? {
  String? validateRequired(String message) {
    if (this == null || this!.isEmpty) {
      return message;
    }
    return null;
  }

  String? validateEmail() {
    if (this == null || this!.isEmpty) {
      return AppStrings.emailEmpty;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(this!)) {
      return AppStrings.emailInvalid;
    }
    return null;
  }

  String? validatePassword() {
    if (this == null || this!.isEmpty) {
      return AppStrings.passwordEmpty;
    }
    if (this!.length < 6) {
      return AppStrings.passwordTooShort;
    }
    return null;
  }

  String? validateConfirmPassword(String password) {
    if (this == null || this!.isEmpty) {
      return AppStrings.confirmPasswordEmpty;
    }
    if (this != password) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  }

  String? validateFirstName() {
    if (this == null || this!.isEmpty) {
      return AppStrings.firstNameEmpty;
    }
    if (this!.length < 2) {
      return AppStrings.firstNameTooShort;
    }
    return null;
  }

  String? validateLastName() {
    if (this == null || this!.isEmpty) {
      return AppStrings.lastNameEmpty;
    }
    if (this!.length < 2) {
      return AppStrings.lastNameTooShort;
    }
    return null;
  }
}
