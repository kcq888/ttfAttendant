import 'package:flutter/material.dart';

class InputFormWithIcon extends StatelessWidget {
  const InputFormWithIcon(
      {required this.controller,
      required this.iconPrefix,
      required this.labelText,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.isObscureText = false,
      required this.onChanged,
      required this.onSaved,
      super.key});

  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool isObscureText;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    FocusNode fnode = FocusNode();
    return TextFormField(
      focusNode: fnode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          filled: true, prefixIcon: Icon(iconPrefix), labelText: labelText),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: isObscureText,
      validator: validator,
    );
  }
}
