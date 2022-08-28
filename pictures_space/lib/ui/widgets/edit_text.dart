import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatelessWidget {
  const EditText(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validateInput,
      this.formatter,
      this.keyboardType = TextInputType.text,
      this.maxLength = 20,
      this.obscureText = false})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final List<TextInputFormatter>? formatter;
  final String? Function(String? text) validateInput;
  final TextInputType keyboardType;
  final int maxLength;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          obscureText: obscureText,
          maxLength: maxLength,
          keyboardType: keyboardType,
          controller: controller,
          validator: validateInput,
          decoration: InputDecoration(
            label: Text(label),
          ),
          inputFormatters: formatter,
        ),
      ),
    );
  }
}
