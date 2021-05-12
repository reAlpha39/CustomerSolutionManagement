import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerInfoTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final int? maxLines;
  final TextInputType? keyboardType;

  CustomerInfoTextField(
      {this.controller, this.labelText, this.maxLines, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
          maxLines: maxLines,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) {
            if (value == '') {
              return 'Data harus diisi';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
            labelText: labelText,
          )),
    );
  }
}
