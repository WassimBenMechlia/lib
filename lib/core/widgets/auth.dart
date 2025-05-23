import 'package:flutter/material.dart';

class AuthFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassWord;
  const AuthFiled({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassWord= false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
      obscureText: isPassWord 
    );
  }
}
