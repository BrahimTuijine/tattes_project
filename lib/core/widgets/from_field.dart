// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:products_management/core/strings/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.onsaved,
    required this.validator,
    required this.texthint,
    this.minLines,
    required this.label,
  }) : super(key: key);

  final FormFieldSetter<String>? onsaved;
  final String? Function(String?)? validator;
  final String texthint;
  final int? minLines;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: blueGreen, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          minLines: minLines,
          onSaved: onsaved,
          validator: validator,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: grey),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: blueGreen),
            ),
            filled: false,
            hintText: texthint,
            hintStyle: const TextStyle(color: grey, fontSize: 13),
          ),
        ),
      ],
    );
  }
}