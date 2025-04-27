import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputFields extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscured;
  final String? Function(dynamic value)? validator;
  final TextInputType? keyboardType;
  final List<String>? autoFill;

  const InputFields({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscured = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.autoFill,
  });

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  late bool _obscureText;
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscured;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      key: _formFieldKey,
      autofillHints: widget.autoFill,
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: Colors.white),
      obscureText: _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1A1A2E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon:
            widget.obscured
                ? IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/obscure.svg",
                    fit: BoxFit.cover,
                    height: 19,
                    width: 22,
                  ),
                  onPressed: _toggleVisibility,
                )
                : null,
      ),
    );
  }
}
