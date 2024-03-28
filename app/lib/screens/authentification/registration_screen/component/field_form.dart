
import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  const FieldForm({
    super.key,
    required this.controller, required this.label, required this.hint,
  });
  final TextEditingController controller;
  final String label;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:  InputDecoration(
          contentPadding:  const EdgeInsets.only(
            top: 0,
            left: 15,
          ),
          hintText: hint,
          labelText: label,
          border: const OutlineInputBorder()),
    );
  }
}
