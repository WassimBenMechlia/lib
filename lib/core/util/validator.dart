import 'package:flutter/cupertino.dart';

String? validateField({
  required BuildContext context,
  required String? value,
  required String message,
}) {
  if (value == null || value.isEmpty) {
    return message;
  }
  return null;
}

String? validatePhoneNumber(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return "please enter a phone number";
  }
  Pattern pattern = r'^\d{3,20}$';
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value)) {
    return "please enter a valid number";
  }
  return null;
}

String? validatePassword(BuildContext context, String password) {
  //final RegExp passwordRegex = RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,30}$');
  final RegExp passwordRegex = RegExp(r'^.{6,30}$');
  if (password.isEmpty) {
    return "Enter a password";
  }
  if (password.length < 6 || !passwordRegex.hasMatch(password)) {
    return "Password must be at least 8 characters";
  }
  return null;
}

String? validateConfirmationPassword(
  BuildContext context,
  String? password,
  String? confirmPassword,
) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return "Enter a password";
  } else if (password != confirmPassword) {
    return "passwords do not match";
  }
  return null;
}

String? validateEmail(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return "Enter an Email";
  }
  Pattern pattern =
      r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9])*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value)) {
    return "Invalid Email format";
  }
  return null;
}

String? validateName(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return "please enter your name";
  }
  Pattern pattern = r"^[a-zA-ZÀ-ÿ\s\'-]+$";
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value)) {
    return "the name only accepts letters";
  }
  return null;
}

String? validateFistName(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return "first name";
  }
  Pattern pattern = r"^[a-zA-ZÀ-ÿ\s\'-]+$";
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value)) {
    return "the name only accepts letters";
  }
  return null;
}

String? validateLastName(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return "last nam";
  }
  Pattern pattern = r"^[a-zA-ZÀ-ÿ\s\'-]+$";
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value)) {
    return "the name only accepts letters";
  }
  return null;
}

String? validateFullName(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return "the name only accepts letters";
  }
  if (!value.trim().contains(" ")) {
    return "please enter a first and last name";
  }
  Pattern pattern = r"^[a-zA-ZÀ-ÿ\s\'-]+$";
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value)) {
    return "the name only accepts letters";
  }

  return null;
}

String? validateZipCode(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return "enter a zip code";
  }
  Pattern pattern =
      r'^\d{4,10}$'; // Adjust the pattern based on the ZIP code format you need
  RegExp regex = RegExp(pattern as String);
  if (!regex.hasMatch(value)) {
    return "enter a valid zip code";
  }
  return null;
}
