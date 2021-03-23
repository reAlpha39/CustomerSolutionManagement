import 'package:flutter/material.dart';

class CustomerInfoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;

  CustomerInfoTextField({this.controller, this.labelText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.blueGrey),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              validator: (value) {
                if (value == '') {
                  return 'Data harus diisi';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
                labelText: labelText,
              ))),
    );
  }
}
