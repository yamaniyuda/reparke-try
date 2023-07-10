import 'package:flutter/material.dart';

class RFormTextFieldWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;

  const RFormTextFieldWidget({
    Key? key,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.onSaved,
    this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: Colors.black54,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(14),
        )
      ),
    );
  }
}
